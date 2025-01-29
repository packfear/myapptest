import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  const MessageLine(
      {super.key,
      this.messageText,
      required this.messageSender,
      required this.isMe});

  final String? messageText;
  final String messageSender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: TextStyle(fontSize: 15, color: Colors.grey[700]),
          ),
          Material(
              elevation: 5,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.orange[700],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$messageText',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
