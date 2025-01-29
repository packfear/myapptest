import 'package:flutter/material.dart';

class MyTexfield extends StatelessWidget {
  final String hintText;
  final ValueChanged onChanged;
  final bool isabscured;
  final TextInputType keyboardType;

  const MyTexfield(
      {super.key, required this.hintText, required this.onChanged, required this.isabscured,required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      keyboardType: keyboardType,
      obscureText: isabscured,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}