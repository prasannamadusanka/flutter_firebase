import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class fireauth extends StatefulWidget {
  const fireauth({Key? key}) : super(key: key);

  @override
  State<fireauth> createState() => _fireauthState();
}

class _fireauthState extends State<fireauth> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: myController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: myController1,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  printConsole();
                },
                child: const Text("Sign up")),
            ElevatedButton(
                onPressed: () {
                  printConsoleTwo();
                },
                child: const Text("login")),
            ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                },
                child: const Text("Sign in with google")),
          ],
        ),
      ),
    );
  }

  void printConsole() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: myController.text,
        password: myController1.text,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void printConsoleTwo() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: myController.text,
        password: myController1.text,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn( clientId: "759875366477-7hflg3mo2gec6ihdb1332lc87grqbnl5.apps.googleusercontent.com",).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print(credential);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
