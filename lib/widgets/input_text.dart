import 'package:flutter/material.dart';

Widget inputText(BuildContext context, TextEditingController controller, String label) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
    ),
  );
}