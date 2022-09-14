import 'package:firebase_demo/homepage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth.dart';
import 'landing.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const form(),
    );
  }
}

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);
  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  // TextEditingController _name=TextEditingController()
  @override
  

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body:landing(),
    );
  }
}
