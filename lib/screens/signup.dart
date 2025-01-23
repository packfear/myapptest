import 'package:flutter/material.dart';
import 'package:myapp/widgets/mybutton.dart';
import 'package:myapp/widgets/mytextfield.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
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
            const SizedBox(height: 10,),
            MyButton(color: Colors.blue[900]!, onPressed: (){}, text: 'Sign Up')

          ],
        ),
      ),
    );
  }
}