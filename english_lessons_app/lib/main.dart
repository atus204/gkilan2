import 'package:flutter/material.dart';
import 'screens/lessons_list_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EnglishApp());
}

class EnglishApp extends StatelessWidget {
  const EnglishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English Lessons',
      theme: AppTheme.darkTheme,
      home: const LessonsListScreen(),
    );
  }
}