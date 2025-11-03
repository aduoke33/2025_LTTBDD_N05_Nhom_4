import 'package:english_forum_app/models/user.dart';

class Post {
  final User author;
  final String timeAgo;
  final String title;
  final String content;
  final String? imageUrl;
  int likes;
  final int comments;
  final int shares;

  Post({
    required this.author,
    required this.timeAgo,
    this.title = '',
    required this.content,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}

List<Post> getExamplePosts() {
  return [
    Post(
      author: exampleUser,
      timeAgo: '5m',
      title: 'Just discovered a new Flutter package!',
      content:
          'The "animations" package is amazing for creating complex animations with ease. Highly recommend checking it out. #flutter #development',
      likes: 15,
      comments: 4,
      shares: 2,
    ),
    Post(
      author: User(
        id: '2',
        name: 'Jane Smith',
        email: 'jane.smith@example.com',
        avatarUrl: 'https://i.pravatar.cc/150?img=5',
      ),
      timeAgo: '1h',
      title: 'How to manage state in a large application?',
      content:
          "I'm looking for advice on the best state management solutions for a large-scale Flutter project. What are your experiences with BLoC, Provider, or Riverpod?",
      imageUrl:
          'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      likes: 42,
      comments: 18,
      shares: 7,
    ),
  ];
}
