 import 'package:flutter/material.dart';
import 'package:frontend/src/widgets/main_drawer_item.dart';

Widget mainDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(''),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
          ),
          buildDrawerItem(
            context,
            icon: Icons.search,
            label: 'Matrices',
            route: '/matrix',
          ),
          buildDrawerItem(
            context,
            icon: Icons.report,
            label: 'Calculus',
            route: '/calculus',
          ),
          buildDrawerItem(
            context,
            icon: Icons.newspaper,
            label: 'Numerical Analysis',
            route: '/numerical',
          ),
          buildDrawerItem(
            context,
            icon: Icons.info,
            label: 'Probability',
            route: '/probability',
          ),
          buildDrawerItem(
            context,
            icon: Icons.book,
            label: 'Algebra',
            route: '/algebra',
          ),
          buildDrawerItem(
            context,
            icon: Icons.policy,
            label: 'Linear Algebra',
            route: '/linearalgebra',
          ),
          buildDrawerItem(
            context,
            icon: Icons.question_answer,
            label: 'Resources',
            route: '/resources',
          ),
        ],
      ),
    );
  }