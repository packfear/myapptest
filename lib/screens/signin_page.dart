import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/widgets/mybutton.dart';
import 'package:myapp/widgets/mytextfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _auth = FirebaseAuth.instance;
  bool _saving = false;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
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
                      setState(() {
                        _saving = true;
                      });
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      Navigator.pushNamed(context, 'chat_page');
                      setState(() {
                        _saving = false;
                      });
                                        } on Exception catch (e) {
                      // TODO
                      print(e);
                    }
                  },
                  text: 'Sign In')
            ],
          ),
        ),
      ),
    );
  }
}
