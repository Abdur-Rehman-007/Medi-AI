import 'package:flutter/material.dart';

class AISymptomAnalysisScreen extends StatefulWidget {
  const AISymptomAnalysisScreen({super.key});

  @override
  State<AISymptomAnalysisScreen> createState() =>
      _AISymptomAnalysisScreenState();
}

class _AISymptomAnalysisScreenState extends State<AISymptomAnalysisScreen> {
  final TextEditingController symptomController = TextEditingController();
  String? aiResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFb6b597),
        title: const Text(
          "AI Symptom Analysis",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Describe your symptoms below:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),

            // Text area for symptom input
            TextField(
              controller: symptomController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "e.g. I have a sore throat and mild fever for 2 days...",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Analyze button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFb6b597),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    aiResponse =
                        "Based on your symptoms, you might have a common cold or mild infection. Please stay hydrated and rest. If symptoms persist, consult a doctor.";
                  });
                },
                child: const Text(
                  "Analyze",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Show AI response
            if (aiResponse != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  aiResponse!,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
