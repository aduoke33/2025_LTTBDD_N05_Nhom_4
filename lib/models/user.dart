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
