import 'package:flutter/material.dart';

TextField reuseIt(
  TextEditingController controller,
  bool isPass,
  String name,
) {
  return TextField(
    controller: controller,
    obscureText: isPass,
    enableSuggestions: !isPass,
    autocorrect: !isPass,
    decoration: InputDecoration(
        labelText: name,
        hintText: name,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid))),
    style: TextStyle(color: Colors.black38),
  );
}
