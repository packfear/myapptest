import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/chat_page.dart';
import 'package:myapp/screens/signin_page.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Message me',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomePage(),
        initialRoute:
            _auth.currentUser != null ? 'chat_page' : 'welcome_page' ,
        routes: {
          'welcome_page': (context) => const WelcomePage(),
          'signup': (context) => const SingUpPage(),
          'chat_page': (context) => const ChatPage(),
          'signin_page': (context) => const SignInPage(),
        });
  }
}
