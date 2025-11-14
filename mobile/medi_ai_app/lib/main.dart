import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medi-AI Health System',
      theme: ThemeData(
        primaryColor: const Color(0xFF095d7e),
      ),
      home: const SignupScreen(),
    );
  }
}
