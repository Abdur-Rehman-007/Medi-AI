import 'package:flutter/material.dart';

class DoctorRequestScreen extends StatelessWidget {
  const DoctorRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe2fcd6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFccecee),
        title: const Text(
          "Doctor Request",
          style: TextStyle(color: Color(0xFF095d7e), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Doctor Request Page (Coming Soon)",
          style: TextStyle(fontSize: 18, color: Color(0xFF095d7e)),
        ),
      ),
    );
  }
}
