import 'package:english_forum_app/models/post.dart';
import 'package:english_forum_app/models/user.dart';

List<Post> getExamplePosts() {
  return [
    Post(
      author: exampleUser,
      timeAgo: '5m',
      title: 'Just discovered a new Flutter package!',
      content:
          'The "animations" package is amazing for creating complex animations with ease. Highly recommend checking it out. #flutter #development',
      likesCount: 15,
      commentsCount: 4,
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
      likesCount: 42,
      commentsCount: 18,
      shares: 7,
    ),
    Post(
      author: exampleUser,
      timeAgo: '3d',
      title: 'My thoughts on the new Dart 3 features',
      content: 'Patterns and records are a game-changer for productivity!',
      likesCount: 150,
      commentsCount: 23,
      shares: 12,
    ),
  ];
}
