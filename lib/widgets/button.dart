import 'package:flutter/material.dart';

import '../config/colors_theme.dart';

Widget button(BuildContext context, String text, Widget Function() login) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: ColorsTheme.buttonColor, elevation: 10),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext) => login()
          )
      );
    },
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white
      ),
    ),
  );
}