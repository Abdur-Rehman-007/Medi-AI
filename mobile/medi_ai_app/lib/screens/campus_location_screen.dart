import 'package:flutter/material.dart';
import 'student_portal_screen.dart';

class CampusLocationScreen extends StatefulWidget {
  const CampusLocationScreen({super.key});

  @override
  State<CampusLocationScreen> createState() => _CampusLocationScreenState();
}

class _CampusLocationScreenState extends State<CampusLocationScreen> {
  String? selectedCampus;

  final List<String> campuses = [
    'City Campus',
    'Takatu Campus',
    'Satellite Town',
    'Main Campus',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFcce0cc),
        title: const Text(
          'Campus Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your campus',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            ...campuses.map((campus) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCampus == campus
                          ? const Color(0xFFa0b89a)
                          : Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedCampus = campus;
                      });
                    },
                    child: Text(campus),
                  ),
                )),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedCampus != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentPortalScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a campus."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFa0b89a),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
