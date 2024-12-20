
import 'package:flutter/material.dart';

class ProbabilityScreen extends StatelessWidget {
  const ProbabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Probability'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // Navigate back to previous screen
        ),
      ),
      body: const Center(
        child: Text('Probability content here'),
      ),
    );
  }
}
