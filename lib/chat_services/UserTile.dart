import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const Usertile({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 61, 61, 61),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        child: Row(
          
          children: [
            
            Icon(Icons.person),
            SizedBox(width: 20,),
            Text(text,style: TextStyle(
              fontSize: 20,
            ),),
          ],
        ),
      ),
    );
  }
}