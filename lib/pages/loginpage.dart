import 'package:chat_app/auth_services/auth_service.dart';
import 'package:chat_app/components/text_feild.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final void Function()? onTap;
  final TextEditingController _pwController = TextEditingController();
  LoginPage({
    required this.onTap,
    super.key,
  });
  void login(BuildContext context) async {
    final authService = AuthService();
    //try login
    try {
      await authService.signinwithEmailandPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      print('123');
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 80,
            ),
            SizedBox(
              height: 50,
            ),
            TextFeild(
              controller: _emailController,
              hintText: "email",
              icon: Icon(Icons.person),
            ),
            SizedBox(
              height: 10,
            ),
            TextFeild(
              controller: _pwController,
              hintText: "password",
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => login(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 118.0, vertical: 15),
                  child: Text(
                    "singin",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "create a account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
