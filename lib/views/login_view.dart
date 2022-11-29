import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  static const tag = "LoginView";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horse Stylé"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("")
          ],
        ),
      ),
    );
  }
}