// ignore: file_names
// ignore_for_file: prefer_const_constructors


import 'package:chat_app/auth_services/auth_service.dart';
import 'package:chat_app/pages/setting.dart';
import 'package:flutter/material.dart';
class Mydrawer extends StatelessWidget {
   Mydrawer({super.key});
    final auth=AuthService();

  void singout() async{
    auth.singout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           DrawerHeader(child: Center(child: Icon(Icons.message,size: 40,))),
           SizedBox(height: 40,),
          Expanded(
            child: Column(
              
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text('H O M E'),
                    leading: Icon(Icons.home),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                 SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: Text('S E T T I N G S'),
                    leading: Icon(Icons.settings),
                    onTap: (){             
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>SettingsPage(),));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all( 30.0),
            child: ListTile(
              title: Text('L O G O U T'),
              leading: Icon(Icons.logout),
              onTap: singout,
            ),
          )
        ]
      ),
    );
  }
}