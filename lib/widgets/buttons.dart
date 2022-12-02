import 'package:flutter/material.dart';

import '../config/colors_theme.dart';

Widget buttonGeneral(BuildContext context, String text, Widget Function() page) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: ColorsTheme.buttonColor, elevation: 10),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => page()
          )
      );
    },
    child: Text(
      text,
      semanticsLabel: text,
      style: const TextStyle(
        color: Colors.white
      ),
    ),
  );
}

Widget buttonFormForDateAndHours(BuildContext context, String text, Future<void> Function()) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorsTheme.buttonColor, elevation: 10),
    onPressed: () => Function(),
    child: Text(
      text,
      semanticsLabel: text,
    )
  );
}