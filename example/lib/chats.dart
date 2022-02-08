import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newchatapp_example/messages.dart';
import 'package:newchatapp_example/newchat.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Chat'),
          actions: [
            DropdownButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                items: [
                  DropdownMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('LogOut'),
                      ],
                    ),
                    value: 'logout',
                  ),
                ],
                onChanged: (val) {
                  if (val == 'logout') FirebaseAuth.instance.signOut();
                })
          ],
        ),
        body: Container(
          child: Column(
            children: [Expanded(child: Message()), NewChat()],
          ),
        ));
  }
}
