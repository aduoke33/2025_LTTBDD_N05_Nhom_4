import 'package:flutter/material.dart';

// simple data model for a task
class Task {
  final String id;
  String title;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({super.key});

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  final List<Task> _tasks = [
    Task(id: '1', title: 'Complete Math Assignment', isCompleted: true),
    Task(id: '2', title: 'Read Chapter 3 of History book'),
    Task(id: '3', title: 'Prepare English presentation'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tasks'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.title),
          );
        },
      ),
    );
  }
}
