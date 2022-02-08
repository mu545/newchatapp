import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewChat extends StatefulWidget {
  const NewChat({Key? key}) : super(key: key);

  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final _contrilaer = TextEditingController();
  String _entermessage = '';
  _sendmessages() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userdata = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': _entermessage,
      'createdAt': Timestamp.now(),
      'username': 'muhammed',
      'userid': 'id'
    });
    _contrilaer.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              controller: _contrilaer,
              onChanged: (val) {
                setState(() {
                  _entermessage = val;
                });
              },
              decoration: InputDecoration(
                  hintText: "Write message...",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none),
            ),
          ),
          IconButton(
              onPressed: _entermessage.isEmpty ? null : _sendmessages,
              icon: Icon(
                Icons.send,
                color: Colors.pinkAccent,
              ))
        ],
      ),
    );
  }
}
