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
    decoration: InputDecoration(hintText: name, border: OutlineInputBorder()),
  );
}
