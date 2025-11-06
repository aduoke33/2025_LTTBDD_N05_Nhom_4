import 'package:english_forum_app/l10n/app_localizations.dart';
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
  final User currentUser = exampleUser;

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
    final l10n = AppLocalizations.of(context)!;
    final userPosts = getExamplePosts()
        .where((post) => post.author.id == currentUser.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.get('profile') ?? 'Profile'),
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
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(currentUser.avatarUrl),
                    ),
                    const SizedBox(width: 24),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn(
                            l10n.get('posts') ?? 'Posts',
                            userPosts.length.toString(),
                          ),
                          _buildStatColumn(
                            l10n.get('followers') ?? 'Followers',
                            currentUser.followersCount.toString(),
                          ),
                          _buildStatColumn(
                            l10n.get('following') ?? 'Following',
                            currentUser.followingCount.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

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

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(l10n.get('editProfileComingSoon') ??
                              'Edit profile coming soon'),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(l10n.get('editProfile') ?? 'Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  icon: const Icon(Icons.grid_on),
                  text: l10n.get('posts') ?? 'Posts'),
              Tab(
                  icon: const Icon(Icons.bookmark_border),
                  text: l10n.get('saved') ?? 'Saved'),
              Tab(
                  icon: const Icon(Icons.person_outline),
                  text: l10n.get('tagged') ?? 'Tagged'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                userPosts.isEmpty
                    ? Center(
                        child: Text(
                            l10n.get('noPostsYet') ?? 'No posts yet'))
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
                                '${post.likesCount} ${l10n.get('likes') ?? 'likes'} • ${post.commentsCount} ${l10n.get('comments') ?? 'comments'}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                Center(
                    child: Text(l10n.get('savedPostsComingSoon') ??
                        'Saved posts feature coming soon')),

                Center(
                    child: Text(l10n.get('taggedPostsComingSoon') ??
                        'Tagged posts feature coming soon')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
