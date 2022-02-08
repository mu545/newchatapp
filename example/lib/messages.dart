import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp_example/messagerow.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final user = FirebaseAuth.instance.currentUser;
          return ListView.builder(
              reverse: true,
              itemCount: snapshot.data!.size,
              itemBuilder: (ctx, ind) => Messageroe(
                  key: ValueKey(snapshot.data!.docs[ind].id),
                  username: snapshot.data!.docs[ind]['username'],
                  messages: snapshot.data!.docs[ind]['text'],
                  isme: snapshot.data!.docs[ind]['userid'] == user!.uid));
        });
  }
}
