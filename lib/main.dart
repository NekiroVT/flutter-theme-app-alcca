// lib/main.dart
import 'package:flutter/material.dart';
import 'theme.dart';
import 'presentation/dashboard_screen.dart';

void main() {
  runApp(const ThemeShowcaseApp());
}

class ThemeShowcaseApp extends StatefulWidget {
  const ThemeShowcaseApp({super.key});

  @override
  State<ThemeShowcaseApp> createState() => _ThemeShowcaseAppState();
}

class _ThemeShowcaseAppState extends State<ThemeShowcaseApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter-theme-app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: DashboardScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}
