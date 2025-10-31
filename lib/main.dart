import 'package:english_forum_app/models/post.dart';
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
      home: ForumHomePage(),
    );
  }
}

class ForumHomePage extends StatelessWidget {
  ForumHomePage({super.key});

  //mock data
  final List<Post> posts = [
    Post(
      title: 'How to improve English speaking skills?',
      author: 'John Doe',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      content:
          'I have been learning English for 2 years, but my speaking skill is not good. Any tips?',
      likes: 15,
      comments: 7,
    ),
    Post(
      title: 'Best resources for learning vocabulary',
      author: 'Jane Smith',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      content:
          'Could you please share some good websites or apps for learning new English words?',
      likes: 42,
      comments: 12,
    ),
    Post(
      title: 'Difference between "will" and "be going to"',
      author: 'Peter Jones',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      content:
          'I am always confused about when to use "will" and when to use "be going to". Can someone explain?',
      likes: 28,
      comments: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English Forum')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(post.title),
              subtitle: Text('by ${post.author}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.thumb_up_alt_outlined, size: 16),
                      const SizedBox(width: 4),
                      Text(post.likes.toString()),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.comment_outlined, size: 16),
                      const SizedBox(width: 4),
                      Text(post.comments.toString()),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
