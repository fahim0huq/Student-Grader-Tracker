import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
<<<<<<< HEAD
import 'add_subject_screen.dart';
=======
>>>>>>> 279934ef672bf6b77aadc8b7165e5fee559aac4e

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Widget> _screens = [
<<<<<<< HEAD
    AddSubjectScreen(),
=======

>>>>>>> 279934ef672bf6b77aadc8b7165e5fee559aac4e
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
<<<<<<< HEAD

=======
>>>>>>> 279934ef672bf6b77aadc8b7165e5fee559aac4e
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