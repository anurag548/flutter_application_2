import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_widget.dart';
import './home_widget.dart';
import './registration_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeWidget();
              } else {
                return LoginWidget();
              }
            }),
      );
}
