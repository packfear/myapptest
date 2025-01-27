import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/mybutton.dart';
import 'package:myapp/widgets/mytextfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MyTexfield(
              keyboardType: TextInputType.text,
              isabscured: true,
              hintText: 'Password',
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            MyButton(
                color: Colors.orange[900]!,
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, 'chat_page');
                    }
                  } on Exception catch (e) {
                    // TODO
                    print(e);
                  }
                },
                text: 'Sign In')
          ],
        ),
      ),
    );
  }
}
