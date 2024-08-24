import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Icon icon;
  const TextFeild({
    required this.icon,
    required this.controller,
    this.hintText,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
            controller:controller,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 19,
              ),          
                  hintText:hintText,
              prefixIcon: icon,
              enabledBorder:OutlineInputBorder
              (
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 2,color: Color.fromARGB(255, 58, 58, 58)
              )
            ),
            focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(width: 2,color:Color.fromARGB(255, 58, 58, 58),)
            )
           )
           ),
    );
  }
}