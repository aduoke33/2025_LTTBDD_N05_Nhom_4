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
  name: 'Ngo Nhat Dz',
  email: '23010329@st.phenikaa-uni.edu.vn',
  avatarUrl: 'assets/images/2025_01_14_10_42_IMG_8124.PNG',
  bio: 'Flutter developer | Tech enthusiast | Coffee lover ☕',
  followersCount: 234,
  followingCount: 123,
);
