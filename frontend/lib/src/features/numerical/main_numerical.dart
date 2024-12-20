import 'package:flutter/material.dart';

class NumericalAnalysisScreen extends StatelessWidget {
  const NumericalAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numerical Analysis'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // Navigate back to previous screen
        ),
      ),
      body: const Center(
        child: Text('Numerical Analysis content here'),
      ),
    );
  }
}
