import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/main_buld_button.dart';
import 'package:frontend/src/widgets/main_drawer_widget.dart';

class MainOptionScreen extends StatelessWidget {
  const MainOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MathVerse')),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
        automaticallyImplyLeading: false, // Disable the default back arrow
      ),
      drawer: mainDrawer(context),
      body: Stack(
        children: [
          // Add a background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOptionButtonMain(
                      context,
                      icon: Icons.grid_4x4,
                      label: 'Matrices',
                      route: '/matrix',
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.waves,
                      label: 'Calculus',
                      route: '/calculus',
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.analytics,
                      label: 'Numerical Analysis',
                      route: '/numerical',
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.line_axis,
                      label: 'Probability',
                      route: '/probability',
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.edit,
                      label: 'Algebra',
                      route: '/algebra',
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.straight,
                      label: 'Linear Algebra',
                      route: '/linearalgebra',
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 20),
                    buildOptionButtonMain(
                      context,
                      icon: Icons.question_answer,
                      label: 'Resources',
                      route: '/resources',
                      color: Colors.orangeAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}