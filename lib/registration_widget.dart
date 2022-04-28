import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_2/reuse/reusable_assets.dart';

//**TODO: Create a registration page with  */

class RegistrationWidget extends StatefulWidget {
  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _cpassword = TextEditingController();
  final _fname = TextEditingController();
  final _lname = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Register Yourself"),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          reuseIt(_fname, false, "Enter First name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_lname, false, "Enter First name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_email, false, "Enter First name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_password, false, "Enter First name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_cpassword, false, "Enter First name"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(child: const Text('Register'), onPressed: null),
        ]),
      ))));
}
