import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//**TODO: Create a registration page with  */

class RegistrationWidget extends StatefulWidget {
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Register Yourself"),
        ),
        body: Column(),
      );
}
