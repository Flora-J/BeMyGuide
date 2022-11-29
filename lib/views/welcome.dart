import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main_aidant.jpeg"),
              fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}