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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text('English Forum App'),
        ),
      ),
    );
  }
}