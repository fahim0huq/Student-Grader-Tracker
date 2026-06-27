import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_grade_tracker/screens/subject_list_screen.dart';

import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';

import 'add_subject_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _screens = [

    AddSubjectScreen(),
    SubjectListScreen(),

];

  static const List<String> _titles = [
    'Add Subject',
    'Subjects',
    'Summary',
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavigationProvider>();
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[navProvider.index]),
        actions: [

          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(
              themeProvider.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: IndexedStack(
        index: navProvider.index,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navProvider.index,
        onTap: (i) => context.read<NavigationProvider>().setIndex(i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Subjects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Summary',
          ),
        ],
      ),
    );
  }
}