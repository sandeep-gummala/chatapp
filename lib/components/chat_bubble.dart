import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({super.key,
  required this.message,
  required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 6),
      
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green[500] : Colors.grey[900],
        borderRadius: BorderRadius.circular(18),
        
      ),
      child: Text(message,style: TextStyle(
        fontSize: 20,
      ),),
    );
  }
}