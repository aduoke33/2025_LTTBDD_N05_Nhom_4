import 'package:english_forum_app/models/user.dart';

class Post {
  final User author;
  final String timeAgo;
  final String title;
  final String content;
  final String? imageUrl;
  int likesCount;
  final int commentsCount;
  final int shares;

  Post({
    required this.author,
    required this.timeAgo,
    this.title = '',
    required this.content,
    this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.shares = 0,
  });
}

List<Post> getExamplePosts() {
  return [];
}
