class Post {
  final String title;
  final String content;
  final String author;
  final DateTime timestamp;
  final int likes;
  final int comments;

  Post({
    required this.title,
    required this.content,
    required this.author,
    required this.timestamp,
    this.likes = 0,
    this.comments = 0,
  });
}
