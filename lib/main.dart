import 'package:flutter/material.dart';
import 'package:myapp/screens/chat_page.dart';
import 'package:myapp/screens/signin_page.dart';
import 'package:myapp/screens/signup.dart';
import 'package:myapp/screens/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Message me',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WelcomePage(),
        initialRoute: 'welcome_page',
        routes: {
          'welcome_page': (context) => const WelcomePage(),
          'signup': (context) => const SingUpPage(),
          'register_page': (context) => const ChatPage(),
          'signin_page': (context) => const SignInPage(),
        });
  }
}
  