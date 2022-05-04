import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        title: const Text("Register Yourself"),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          reuseIt(_fname, false, "Enter First name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_lname, false, "Enter Last name"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_email, false, "Email"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_password, true, "Password"),
          const SizedBox(
            height: 10,
          ),
          reuseIt(_cpassword, true, "Confirm Password"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              child: const Text('Register'),
              onPressed: () async {
                var result = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _email.text, password: _cpassword.text);
                var user = FirebaseAuth.instance.currentUser;
                var addData = FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid);
                var uid = result.user?.uid;

                // print(addData.id);
                var students = {
                  'email': _email.text,
                  'password': _cpassword.text,
                  'uid': uid,
                  'role': null
                };
                await addData.set(students);
              }),
        ]),
      ))));
}
