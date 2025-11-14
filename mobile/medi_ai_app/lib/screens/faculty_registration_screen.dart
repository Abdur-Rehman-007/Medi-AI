import 'package:flutter/material.dart';
import 'faculty_portal_screen.dart'; // 👈 Add this import

class FacultyRegistrationScreen extends StatefulWidget {
  const FacultyRegistrationScreen({super.key});

  @override
  State<FacultyRegistrationScreen> createState() => _FacultyRegistrationScreenState();
}

class _FacultyRegistrationScreenState extends State<FacultyRegistrationScreen> {
  final employeeIdController = TextEditingController();
  String? selectedDepartment;

  final List<String> departments = [
    'Computer Science',
    'Software Engineering',
    'Information Technology',
    'Cyber Security',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFccecee), // light blue background
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFe2fcd6), // pale green form box
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🧑‍🏫 Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person_2_rounded, color: Color(0xFF095d7e), size: 35),
                    SizedBox(width: 8),
                    Text(
                      "Faculty Registration",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF095d7e),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  "Complete your profile",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 25),

                // Employee ID Field
                TextField(
                  controller: employeeIdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Employee ID",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Department Dropdown
                DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  items: departments
                      .map((dept) => DropdownMenuItem(
                            value: dept,
                            child: Text(dept),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDepartment = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Department",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Complete Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095d7e), // dark blue
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (employeeIdController.text.isNotEmpty &&
                          selectedDepartment != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FacultyPortalScreen(), // 👈 go to faculty portal
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please complete all fields."),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Complete",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

