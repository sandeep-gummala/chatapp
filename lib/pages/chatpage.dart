import 'package:chat_app/auth_services/auth_service.dart';
import 'package:chat_app/chat_services/chat_services.dart';
import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/text_feild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatelessWidget {
  final String recivermail;
  final String receiverID;
   Chatpage({super.key,required this.recivermail,required this.receiverID});
   final TextEditingController messagecontroller=TextEditingController();
   final AuthService _authService=AuthService();
   final ChatServices _chatServices=ChatServices();
   //send message
   void sendmessage() async{
    if(messagecontroller.text.isNotEmpty){
      await _chatServices.sendMessage(receiverID, messagecontroller.text);
      messagecontroller.clear();
     }  
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recivermail),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //display chats
            Expanded(
              child: _builtchatpage(),
            ),
            //userinput
            _builtuserinput(),
          ],
        ),
      ),
    );
    
  }
  Widget _builtchatpage() {
      String senderID= _authService.getCurrentUser()!.uid;
      return StreamBuilder(
        stream: _chatServices.getMessage(receiverID, senderID),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text('Error');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text("Loading...");
          }
          return ListView(
            children: 
              snapshot.data!.docs.map((doc)=>_builtmessageitem(doc)).toList(),

          );
        });
    }
    //builtmessageitem
    Widget _builtmessageitem(DocumentSnapshot doc){
       Map<String,dynamic> data= doc.data()as Map<String,dynamic>;

       bool isCurrentUser =data["senderID"]==_authService.getCurrentUser()!.uid;

       var alignment =isCurrentUser? Alignment.centerRight:Alignment.centerLeft;
       return Container(
        child: Container(
          alignment: alignment,
          child: Column(
            children: [
              ChatBubble(message: data["message"], isCurrentUser: isCurrentUser)
            ],
          )
          ),
        );
    }
    //input
    Widget _builtuserinput(){
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
        children: [
          Expanded(
            child: TextFeild(
              hintText: 'text here', 
              controller: messagecontroller,
              icon: Icon(Icons.chat_bubble_outline_rounded)
              ,)),
          IconButton(
            onPressed: sendmessage,
             icon: Icon(Icons.send,color: Colors.green,size:30 ,)),
        ],
       ),
     );
    }
}