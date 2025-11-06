import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:english_forum_app/repositories/example_post.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Post> _posts;

  final TextEditingController _postController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _posts = getExamplePosts();
  }

  @override
  void dispose() {
    _postController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _showCreatePostDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.get('createPost') ?? 'Create Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText:
                    l10n.get('whatsOnYourMind') ?? 'What\'s on your mind?',
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                hintText:
                    l10n.get('pasteImageUrl') ?? 'Paste image URL (optional)',
                labelText: l10n.get('imageUrl') ?? 'Image URL',
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.get('cancel') ?? 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_postController.text.trim().isNotEmpty) {
                setState(() {
                  _posts.insert(
                    0,
                    Post(
                      author: exampleUser,
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
            child: Text(l10n.get('post') ?? 'Post'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.get('englishForum') ?? 'English Forum'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return PostCard(post: post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
