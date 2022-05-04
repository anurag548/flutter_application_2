import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/testPage.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError) {
            print('Error');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    print(snapshot.data);
                    User? user = snapshot.data;
                    rollCheck() async {
                      bool future = await checkRoll(context);
                      if (future == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => testPage()));
                      } else {
                        return FirebaseAuth.instance.signOut();
                      }
                    }

                    rollCheck();
                  }
                  return Scaffold(
                      appBar: AppBar(
                    title: const Text('Sign in'),
                    actions: [
                      ElevatedButton(
                          onPressed: () => FirebaseAuth.instance.signOut(),
                          child: const Text('Sign out'))
                    ],
                  ));
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

Future<bool> checkRoll(context) async {
  var currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser!.uid == null) {
    return false;
  } else {
    bool checkAdmin;
    var doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (doc.data()!['role'] == 'admin') {
      checkAdmin = true;
    } else {
      checkAdmin = false;
    }

    return checkAdmin;
  }
}
