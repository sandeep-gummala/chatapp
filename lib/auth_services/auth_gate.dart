import 'package:chat_app/pages/loginorsignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/HomePage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges()
      , builder: (context,snapshot){
        if (snapshot.hasData)
        {
          return   Homepage();
        }
        else
        {
          return const LoginorRegister();
        }
      }),
    );
  }
}


