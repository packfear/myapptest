import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  late User signedUser;
  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedUser = user;
        print(user.email);
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  void messagesStream() async {
    final snapshots = _firestore.collection('messages').snapshots();

    await for (var snapshot in snapshots) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  // void getMessages() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
        title: Row(
          children: [
            Image.asset(
              'images/login.png',
              height: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Message Me',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.orange,
              width: 2,
            ))),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (value) {
                    messageText = value;
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    hintText: 'Enter your message here',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                )),
                TextButton(
                    onPressed: () {
                      try {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': signedUser.email,
                        });
                      } on Exception catch (e) {
                        // TODO
                        print(e);
                      }
                    },
                    child: Text('Send',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 18,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          )
        ],
      )),
    );
  }
}
