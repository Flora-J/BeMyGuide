import 'package:be_my_guide/views/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be my Guide',
      theme: ThemeData(
        fontFamily: 'Roboto Mono',
        primaryColor: const Color.fromARGB(255, 245, 245, 245),
      ),
      home: const Welcome(title: 'Be My Guide'),
    );
  }
}

