import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp_example/authform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submit(String email, String username, String pass, bool isLogin,
      File imagess, BuildContext ctx) async {
    UserCredential authresult;
    try {
      if (isLogin) {
        authresult = await _auth.signInWithEmailAndPassword(
            email: email, password: pass);
      } else {
        authresult = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(authresult.user!.uid + 'jpg');
        await ref.putFile(imagess);

        final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance // to put the data in DB
            .collection('user')
            .doc(authresult.user!.uid)
            .set({'username': username, 'password': pass, 'imageurl': url});
      }
    } on FirebaseAuthException catch (e) {
      String messages = 'Error';
      if (e.code == 'weak-password') {
        messages = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        messages = 'The account already exists for that email.';
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(messages),
        backgroundColor: Colors.blue,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: AuthForm(_submit),
    );
  }
}
