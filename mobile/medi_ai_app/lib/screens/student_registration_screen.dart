import 'package:flutter/material.dart';
import 'campus_location_screen.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({super.key});

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final cmsController = TextEditingController();
  final ageController = TextEditingController();

  String? selectedDepartment;
  String? selectedGender;

  final List<String> departments = [
    "Software Engineering",
    "Computer Science",
    "Information Technology",
    "Artificial Intelligence",
  ];

  final List<String> genders = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFccecee),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 360,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFe2fcd6),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.school, color: Color(0xFF095d7e), size: 40),
                const SizedBox(height: 8),
                const Text(
                  "Student Registration",
                  style: TextStyle(
                    color: Color(0xFF095d7e),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Complete your profile",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 25),

                // CMS ID
                TextField(
                  controller: cmsController,
                  decoration: InputDecoration(
                    labelText: "CMS ID",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Department
                DropdownButtonFormField<String>(
                  value: selectedDepartment,
                  items: departments
                      .map(
                        (dept) =>
                            DropdownMenuItem(value: dept, child: Text(dept)),
                      )
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
                const SizedBox(height: 15),

                // Gender
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  items: genders
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Gender",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Age
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Next Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095d7e),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusLocationScreen(),
                        ),
                      );
                      // Next page logic yahan ayega
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Profile saved successfully!"),
                        ),
                      );
                    },
                    child: const Text(
                      "Next",
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
