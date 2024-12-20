import 'package:flutter/material.dart';

class LinearAlgebraScreen extends StatelessWidget {
  const LinearAlgebraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linear Algebra'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context), // Navigate back to previous screen
        ),
      ),
      body: const Center(
        child: Text('Linear Algebra content here'),
      ),
    );
  }
}
