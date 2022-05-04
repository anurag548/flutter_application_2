import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './login_widget.dart';
import './home_widget.dart';
import './registration_widget.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  String? sendemail;
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            user = snapshot.data;

            if (user != null) {
              sendemail = user!.email;
              return HomeWidget();
            } else {
              return LoginWidget();
            }
          }),
    );
  }
}
