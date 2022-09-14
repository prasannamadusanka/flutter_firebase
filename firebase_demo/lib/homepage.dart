import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
 

  @override
  Widget build(BuildContext context) {
 return Scaffold(
        body: Center(
      child: Column(children: [
        Text("signed in"),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("sognout"))
      ]),
    ));
  }
}
