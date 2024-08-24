// ignore_for_file: prefer_const_constructors

import 'package:chat_app/auth_services/auth_service.dart';
import 'package:chat_app/components/text_feild.dart';
import 'package:flutter/material.dart';

class Singin extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final void Function()? onTap;
  final TextEditingController _pwController=TextEditingController();
  final TextEditingController _confirmController=TextEditingController();
  
   Singin({
    required this.onTap,
    super.key});
    void singin(BuildContext context)async{
    final auth = AuthService();
    if(_pwController.text==_confirmController.text)
    {
      try{
      auth.singupwithemailpassword(_emailController.text, _pwController.text,);
      }catch(e){
        
    showDialog(
      context: context, builder: (context)=>AlertDialog(title: Text(e.toString()),));
      }
    }
    else{
      showDialog(
      context: context, builder: (context)=>AlertDialog(title: Text('password not matched'),));
      }
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message,
          size: 80,),
          SizedBox(height: 50,),
         TextFeild( controller:_emailController,hintText: "email", icon: Icon(Icons.person),),
           SizedBox(height: 10,),
         TextFeild(controller:_pwController ,hintText: "password",icon:Icon(Icons.lock),),
           SizedBox(height: 10,),
         TextFeild(controller:_confirmController ,hintText: "confirm password",icon: Icon(Icons.lock)),
         SizedBox(height: 20,),
          ElevatedButton(
            onPressed: ()=>singin(context),
              
            child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 108.0,vertical: 15),
             child: Text("Register",style: TextStyle(fontSize: 20),),
           )),
           SizedBox(height: 40,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Have an account",
            style: TextStyle(
              color: Colors.white,fontSize: 20,
            ),),
            SizedBox(width: 6,),
            GestureDetector(
              onTap: onTap,
              child:     
               Text("Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            )
          ],
         )
        ],
       ),
     ),
    );
  }
}