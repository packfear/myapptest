import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/message_line.dart';

class MyStreamBuilder extends StatelessWidget {
  const MyStreamBuilder(
      {super.key,
      required FirebaseFirestore firestore,
      required this.signedUser})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final String signedUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];

          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.orange[700],
            ));
          }
          final messages = snapshot.data!.docs;
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final messageWidget = MessageLine(
              messageText: messageText,
              messageSender: messageSender,
              isMe: signedUser == messageSender,
            );
            messageWidgets.add(messageWidget);
          }

          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: messageWidgets,
            ),
          );
        });
  }
}
