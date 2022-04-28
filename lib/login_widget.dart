import 'package:flutter_application_2/reuse/reusable_assets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_2/reuse/reusable_assets.dart';
import './registration_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameText = TextEditingController();
  final passwordText = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            reuseIt(usernameText, false, "Enter name"),

            const SizedBox(
              height: 10,
            ),

            //**Password Field */
            TextField(
              controller: passwordText,
              obscureText: _isHidden,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  labelText: "Enter Password",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.solid)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isHidden = !_isHidden;
                      });
                    },
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(child: const Text('Log In'), onPressed: logIn),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    text: 'No Account? ',
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationWidget()));
                        },
                      text: "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary))
                ]))
          ])),
    );
  }

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameText.text.trim(),
        password: passwordText.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
