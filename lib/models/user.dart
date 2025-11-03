class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String? bio;
  final int followersCount;
  final int followingCount;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    this.bio,
    this.followersCount = 0,
    this.followingCount = 0,
  });
}

// Example User for mock data
final exampleUser = User(
  id: '1',
  name: 'John Doe',
  email: 'john.doe@example.com',
  avatarUrl: 'https://i.pravatar.cc/150?img=12',
  bio: 'Flutter developer | Tech enthusiast | Coffee lover ☕',
  followersCount: 234,
  followingCount: 123,
);
