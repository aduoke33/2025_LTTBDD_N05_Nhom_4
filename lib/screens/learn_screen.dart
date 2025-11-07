import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _currentCardIndex = 0;
  bool _showAnswer = false;
  final Set<int> _masteredCards = {};

  final List<Map<String, String>> _flashcards = [
    {
      'word': 'Hello',
      'translation': 'Xin chào',
      'example': 'Hello, how are you?',
    },
    {
      'word': 'Goodbye',
      'translation': 'Tạm biệt',
      'example': 'Goodbye, see you tomorrow!',
    },
    {
      'word': 'Thank you',
      'translation': 'Cảm ơn',
      'example': 'Thank you for your help.',
    },
    {
      'word': 'Please',
      'translation': 'Làm ơn',
      'example': 'Please pass me the salt.',
    },
    {
      'word': 'Sorry',
      'translation': 'Xin lỗi',
      'example': 'Sorry, I made a mistake.',
    },
    {
      'word': 'Yes',
      'translation': 'Có / Vâng',
      'example': 'Yes, I agree with you.',
    },
    {'word': 'No', 'translation': 'Không', 'example': 'No, I don\'t think so.'},
    {
      'word': 'Good morning',
      'translation': 'Chào buổi sáng',
      'example': 'Good morning, everyone!',
    },
    {
      'word': 'Good night',
      'translation': 'Chúc ngủ ngon',
      'example': 'Good night, sleep well.',
    },
    {
      'word': 'Friend',
      'translation': 'Bạn bè',
      'example': 'She is my best friend.',
    },
  ];

  // Tasks section
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
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

  void _toggleMastered() {
    setState(() {
      if (_masteredCards.contains(_currentCardIndex)) {
        _masteredCards.remove(_currentCardIndex);
      } else {
        _masteredCards.add(_currentCardIndex);
      }
    });
  }

  void _previousCard() {
    if (_currentCardIndex > 0) {
      setState(() {
        _currentCardIndex--;
        _showAnswer = false;
      });
    }
  }

  void _nextCard() {
    if (_currentCardIndex < _flashcards.length - 1) {
      setState(() {
        _currentCardIndex++;
        _showAnswer = false;
      });
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

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({'text': _taskController.text, 'completed': false});
      });
      _taskController.clear();
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentCard = _flashcards[_currentCardIndex];
    final isMastered = _masteredCards.contains(_currentCardIndex);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.get('learn') ?? 'Learn'), elevation: 0),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${l10n.get('card') ?? 'Card'} ${_currentCardIndex + 1}/${_flashcards.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${l10n.get('mastered') ?? 'Mastered'}: ${_masteredCards.length}/${_flashcards.length}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showAnswer = !_showAnswer;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentCard['word']!,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 20),
                              if (_showAnswer) ...[
                                Text(
                                  currentCard['translation']!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                  ),
                                  child: Text(
                                    '${l10n.get('example') ?? 'Example:'}\n${currentCard['example']}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ] else
                                Text(
                                  l10n.get('tapToReveal') ?? 'Tap to reveal',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _currentCardIndex > 0
                              ? _previousCard
                              : null,
                          icon: const Icon(Icons.arrow_back, size: 20),
                          label: Text(l10n.get('previous') ?? 'Previous'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _toggleMastered,
                          icon: Icon(
                            isMastered
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            size: 20,
                          ),
                          label: Text(l10n.get('mastered') ?? 'Mastered'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isMastered
                                ? Colors.green
                                : Colors.grey.shade300,
                            foregroundColor: isMastered
                                ? Colors.white
                                : Colors.black87,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _currentCardIndex < _flashcards.length - 1
                              ? _nextCard
                              : null,
                          icon: const Icon(Icons.arrow_forward, size: 20),
                          label: Text(l10n.get('next') ?? 'Next'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Text(
                      l10n.get('dailyTasks') ?? 'Daily Tasks',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
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
                              hintText:
                                  l10n.get('addNewTask') ?? 'Add a new task...',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _addTask,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
