// Text field widget for the app to use throughout the app

import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({Key? key, required this.placeholder}) : super(key: key);

  final String placeholder;
  final String _errorText = 'Please enter a valid email address';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder,
          errorText: _errorText,
          filled: true, // fill the text field with a color (white)
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
