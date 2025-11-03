import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User currentUser = User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
    bio: 'Flutter developer | Tech enthusiast | Coffee lover ☕',
    followersCount: 234,
    followingCount: 123,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
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
                          _buildStatColumn('Posts', '0'),
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
              ],
            ),
          ),
          const Divider(height: 1),
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
