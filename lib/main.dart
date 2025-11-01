import 'package:english_forum_app/screens/home_screen.dart';
import 'package:english_forum_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

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
