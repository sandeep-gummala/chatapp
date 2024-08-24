import 'package:chat_app/pages/loginpage.dart';
import 'package:chat_app/pages/singin.dart';
import 'package:flutter/material.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLogin=true;
  void toggle() {
    setState(() {
      showLogin=!showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
     if(showLogin)
     {
      return LoginPage(onTap:toggle);
     }
     else{
      return Singin(onTap: toggle);
     }
  }
}