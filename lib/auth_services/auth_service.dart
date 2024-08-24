// ignore_for_file: non_constant_identifier_names


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  User?getCurrentUser(){
    return _auth.currentUser;
  }
  //singin
  Future<UserCredential> signinwithEmailandPassword(String email,String password)async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
        );
   _firestore.collection("Users").doc(userCredential.user!.uid).set(
      {
        'uid':userCredential.user!.uid,
        'email':email,
      }
    );
      return userCredential;

    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }
   //signup
   Future<UserCredential> singupwithemailpassword(String email,password)async{
    try{
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
        email: email,
       password: password
        );
        //save user in doc
    _firestore.collection("Users").doc(userCredential.user!.uid).set(
      {
        'uid':userCredential.user!.uid,
        'email':email,
      }
    );
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
   }
   //singout
  Future<void> singout() async{
    return _auth.signOut();
  }
  //errors
}
