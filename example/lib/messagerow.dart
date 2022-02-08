import 'package:flutter/material.dart';

class Messageroe extends StatelessWidget {
  final String messages;
  final Key key;
  final String username;
  final bool isme;

  const Messageroe(
      {required this.messages,
      required this.key,
      required this.username,
      required this.isme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isme ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 140,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: isme ? Colors.grey[300] : Colors.deepOrange[300],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: !isme ? Radius.circular(0) : Radius.circular(14),
                bottomRight: isme ? Radius.circular(0) : Radius.circular(14)),
          ),
          child: Column(
            children: [
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                messages,
                textAlign: isme ? TextAlign.end : TextAlign.start,
              )
            ],
          ),
        )
      ],
    );
  }
}
