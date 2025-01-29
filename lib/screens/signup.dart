import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
  bool _saving = false;

  late String email;
  late String password;
  late String repeatPassword;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _saving,
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
                  MyTexfield(
                    keyboardType: TextInputType.text,
                    isabscured: true,
                    hintText: 'Repeat Password',
                    onChanged: (value) {
                      repeatPassword = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      color: Colors.blue[900]!,
                      onPressed: () async {
                        if (email.isNotEmpty &&
                            password.isNotEmpty &&
                            repeatPassword.isNotEmpty) {
                          try {
                            if (password == repeatPassword) {
                              setState(() {
                                _saving = true;
                              });
                              final user =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              Navigator.pushNamed(context, 'chat_page');
                                                          setState(() {
                                _saving = false;
                              });
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('You have problem'),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all the fields'),
                            ),
                          );
                        }
                      },
                      text: 'Sign Up')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
