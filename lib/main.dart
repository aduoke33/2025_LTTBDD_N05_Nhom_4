import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EnglishForumApp());
}

class EnglishForumApp extends StatelessWidget {
  const EnglishForumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Forum',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
