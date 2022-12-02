// Splash screen for the app
//
// This is the first screen the user sees when they open the app.

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _navigateToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    navigateToLogin();
  }

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        constraints: const BoxConstraints.expand(),
        child: const Center(
          child: Text('Welcome to TradeBuddy!',
              style: TextStyle(fontSize: 30.0, color: Colors.green)),
        ),
      ),
    );
  }
}
