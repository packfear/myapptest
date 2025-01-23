// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:myapp/widgets/mybutton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    height: 180,
                    child: Image.asset("images/login.png"),
                  ),
                  Text(
                    'Message me',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 3, 31, 71)),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MyButton(
                color: Colors.orange[900]!,
                text: "Log In",
                onPressed: () {
                  Navigator.pushNamed(context, 'signin_page');
                },
              ),
              MyButton(
                  color: Colors.blue[900]!,
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  text: 'Sign Up')
            ],
          ),
        ));
  }
}