import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DailyTasksScreen extends StatefulWidget {
  const DailyTasksScreen({super.key});

  @override
  State<DailyTasksScreen> createState() => _DailyTasksScreenState();
}

class _DailyTasksScreenState extends State<DailyTasksScreen> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize default tasks
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final l10n = AppLocalizations.of(context)!;
      if (_tasks.isEmpty) {
        setState(() {
          _tasks.addAll([
            {
              'text':
                  l10n.get('defaultTask1') ?? 'Learn 10 new vocabulary words',
              'completed': false,
            },
            {
              'text':
                  l10n.get('defaultTask2') ??
                  'Practice speaking for 15 minutes',
              'completed': false,
            },
            {
              'text':
                  l10n.get('defaultTask3') ??
                  'Read one news article in English',
              'completed': false,
            },
          ]);
        });
      }
    });
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({'text': _taskController.text, 'completed': false});
      });
      _taskController.clear();
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.get('dailyTasks') ?? 'Daily Tasks')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  onTap: () => _toggleTask(index),
                  title: Text(
                    task['text'],
                    style: TextStyle(
                      decoration: task['completed']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: task['completed'] ? Colors.grey : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: task['completed'],
                    onChanged: (bool? value) => _toggleTask(index),
                    activeColor: Colors.green,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: l10n.get('addNewTask') ?? 'Add a new task...',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(icon: const Icon(Icons.add), onPressed: _addTask),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
