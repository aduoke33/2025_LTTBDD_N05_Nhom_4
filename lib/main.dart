import 'package:english_forum_app/screens/login_screen.dart';
import 'package:english_forum_app/screens/profile_screen.dart';
import 'package:english_forum_app/screens/register_screen.dart';
import 'package:english_forum_app/screens/settings_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
