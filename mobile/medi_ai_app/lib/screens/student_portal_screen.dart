import 'package:flutter/material.dart';
import 'ai_symptom_analysis_screen.dart';
import 'doctor_request_screen.dart';
import 'appointment_screen.dart';

class StudentPortalScreen extends StatelessWidget {
  const StudentPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe2fcd6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFccecee),
        elevation: 0,
        title: const Text(
          "🎓 Student Portal",
          style: TextStyle(
            color: Color(0xFF095d7e),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF095d7e)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Color(0xFF095d7e),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome, Abdur Rehman!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF095d7e),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CMS ID: 59858",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Department: Computer Engineering"),
                  Text("Campus: takatu campus"),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  _buildTile(context, "🤖", "AI Symptom Analysis"),
                  _buildTile(context, "👨‍⚕️", "Doctor Request"),
                  _buildTile(context, "📋", "Appointments"),
                  _buildTile(context, "💊", "Prescriptions"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🧭 Tile function with navigation
  static Widget _buildTile(BuildContext context, String emoji, String label) {
    return GestureDetector(
      onTap: () {
        if (label == "AI Symptom Analysis") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AISymptomAnalysisScreen(),
            ),
          );
        } else if (label == "Doctor Request") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DoctorRequestScreen(),
            ),
          );
        } else if (label == "Appointments") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppointmentScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$label page coming soon!")),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF095d7e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
