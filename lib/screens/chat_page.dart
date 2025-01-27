import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        actions: [
          IconButton(
              onPressed: () {},
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
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    hintText: 'Enter your message here',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                )),
                TextButton(
                    onPressed: () {},
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
