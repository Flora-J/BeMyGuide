import 'package:flutter/material.dart';

Widget inputText(BuildContext context, TextEditingController controller, String label) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        labelText: label,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
    ),
  );
}