import 'package:english_forum_app/models/post.dart';
import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> _posts = [
    Post(
      username: 'Alice',
      timeAgo: '2h ago',
      title: 'Learning English',
      content: 'Learning English every day helps me improve quickly!',
      imageUrl: 'https://picsum.photos/400/200',
      likes: 12,
      comments: 3,
      shares: 1,
    ),
    Post(
      username: 'Bob',
      timeAgo: '5h ago',
      title: 'IELTS Tips',
      content: 'Does anyone have tips for IELTS Writing?',
      imageUrl: null,
      likes: 8,
      comments: 5,
      shares: 2,
    ),
  ];

  final TextEditingController _postController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _postController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _showCreatePostDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _postController,
              decoration: const InputDecoration(
                hintText: 'What\'s on your mind?',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(
                hintText: 'Paste image URL (optional)',
                labelText: 'Image URL',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_postController.text.trim().isNotEmpty) {
                setState(() {
                  _posts.insert(
                    0,
                    Post(
                      username: 'You',
                      timeAgo: 'Just now',
                      content: _postController.text.trim(),
                      imageUrl: _imageUrlController.text.trim().isEmpty
                          ? null
                          : _imageUrlController.text.trim(),
                    ),
                  );
                });
                _postController.clear();
                _imageUrlController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English Forum'), centerTitle: true),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return PostCard(
            post: post,
            onLike: () {
              setState(() {
                post.likes++;
              });
            },
            onComment: () {
              // TODO: Navigate to comments screen
            },
            onShare: () {
              // TODO: Share functionality
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
