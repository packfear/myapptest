import 'package:flutter/material.dart';
import 'package:myapp/widgets/mybutton.dart';
import 'package:myapp/widgets/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 180, child: Image.asset('images/login.png')),
                const SizedBox(
                  height: 30,
                ),
                MyTexfield(
                  keyboardType: TextInputType.emailAddress,
                  isabscured: false,
                  hintText: 'Email',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTexfield(
                  keyboardType: TextInputType.text,
                  isabscured: true,
                  hintText: 'Password',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTexfield(
                  keyboardType: TextInputType.text,
                  isabscured: true,
                  hintText: 'Repeat Password',
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                    color: Colors.blue[900]!, onPressed: () {}, text: 'Sign Up')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
