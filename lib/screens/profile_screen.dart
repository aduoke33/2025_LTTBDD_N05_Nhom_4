import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repositories/example_post.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final User currentUser = User(
    id: '1',
    name: 'Ngo Nhat dz',
    email: 'aduoke33@example.com',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    bio: 'Flutter developer | Tech enthusiast | Cat lover ☕',
    followersCount: 234,
    followingCount: 123,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPosts = getExamplePosts()
        .where((post) => post.author.id == currentUser.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Avatar and Stats
                Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(currentUser.avatarUrl),
                    ),
                    const SizedBox(width: 24),
                    // Stats
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn(
                            'Posts',
                            userPosts.length.toString(),
                          ),
                          _buildStatColumn(
                            'Followers',
                            currentUser.followersCount.toString(),
                          ),
                          _buildStatColumn(
                            'Following',
                            currentUser.followingCount.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Name and Bio
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentUser.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (currentUser.bio != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          currentUser.bio!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Edit Profile Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Edit profile coming soon'),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Tabs
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.grid_on), text: 'Posts'),
              Tab(icon: Icon(Icons.bookmark_border), text: 'Saved'),
              Tab(icon: Icon(Icons.person_outline), text: 'Tagged'),
            ],
          ),
          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Posts Tab
                userPosts.isEmpty
                    ? const Center(child: Text('No posts yet'))
                    : ListView.builder(
                        itemCount: userPosts.length,
                        itemBuilder: (context, index) {
                          final post = userPosts[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: ListTile(
                              leading: post.imageUrl != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        post.imageUrl!,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                              title: Text(
                                post.content,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                '${post.likesCount} likes • ${post.commentsCount} comments',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                // Saved Tab
                const Center(child: Text('Saved posts feature coming soon')),
                // Tagged Tab
                const Center(child: Text('Tagged posts feature coming soon')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
