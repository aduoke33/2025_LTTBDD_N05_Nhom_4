class Post {
  final String username;
  final String timeAgo;
  final String title;
  final String content;
  final String? imageUrl;
  int likes;
  final int comments;
  final int shares;

  Post({
    required this.username,
    required this.timeAgo,
    this.title = '',
    required this.content,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}
