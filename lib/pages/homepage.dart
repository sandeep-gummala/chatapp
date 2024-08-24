import 'package:chat_app/auth_services/auth_service.dart';
import 'package:chat_app/chat_services/UserTile.dart';
import 'package:chat_app/chat_services/chat_services.dart';
import 'package:chat_app/components/mydrawer.dart';
import 'package:chat_app/pages/chatpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final AuthService _authService=AuthService();
  final ChatServices _chatServices=ChatServices();
  Homepage({super.key});
  final auth=AuthService();
  void singout() async{
    auth.singout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text('HOME'),
     ),
    body: buildUsersLists(),
      drawer: Mydrawer(),
    );
  }
  Widget buildUsersLists(){
    return StreamBuilder(
      stream: _chatServices.getuserStream(),
     builder: (context,snapshot){
         if(snapshot.hasError){
           return Text('Error');
         }
         else if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
         }
         else{
          return ListView(
            children: snapshot.data!.map<Widget>((UserData)=>buildUsersItem(UserData,context)).toList(),
          );
         }
     });
  }
  Widget buildUsersItem(Map<String,dynamic> userData, BuildContext context){
     if(userData["email"]!=_authService.getCurrentUser()!.email ){
      return  Usertile(
      onTap: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatpage(
          recivermail: userData["email"],
          receiverID: userData["uid"],)));
      },
      text: userData["email"],
    );
     }
     else{
      return Container();
     }
  }
}

