import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:english_forum_app/l10n/language_provider.dart';
import 'package:english_forum_app/screens/about_team_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _privateAccount = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.get('settings') ?? 'Settings')),
      body: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return ListView(
            children: [
              // Account Section
              _buildSectionHeader(l10n.get('account') ?? 'Account'),
              _buildListTile(
                icon: Icons.person_outline,
                title: l10n.get('editProfile') ?? 'Edit Profile',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit profile coming soon')),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.lock_outline,
                title: l10n.get('changePassword') ?? 'Change Password',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Change password coming soon')),
                  );
                },
              ),
              SwitchListTile(
                secondary: const Icon(Icons.visibility_off_outlined),
                title: Text(l10n.get('privateAccount') ?? 'Private Account'),
                subtitle: Text(l10n.get('privateAccountDescription') ??
                    'Only followers can see your posts'),
                value: _privateAccount,
                onChanged: (value) {
                  setState(() {
                    _privateAccount = value;
                  });
                },
              ),
              const Divider(),

              // Notifications Section
              _buildSectionHeader(
                  l10n.get('notifications') ?? 'Notifications'),
              SwitchListTile(
                secondary: const Icon(Icons.notifications_outlined),
                title: Text(
                    l10n.get('pushNotifications') ?? 'Push Notifications'),
                subtitle: Text(l10n.get('pushNotificationsDescription') ??
                    'Receive push notifications'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              _buildListTile(
                icon: Icons.email_outlined,
                title:
                    l10n.get('emailNotifications') ?? 'Email Notifications',
                subtitle: l10n.get('emailNotificationsDescription') ??
                    'Manage email preferences',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Email settings coming soon')),
                  );
                },
              ),
              const Divider(),

              // Appearance Section
              _buildSectionHeader(l10n.get('appearance') ?? 'Appearance'),
              SwitchListTile(
                secondary: const Icon(Icons.dark_mode_outlined),
                title: Text(l10n.get('darkMode') ?? 'Dark Mode'),
                subtitle: Text(
                    l10n.get('darkModeDescription') ?? 'Enable dark theme'),
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Dark mode ${value ? "enabled" : "disabled"} (UI not implemented yet)',
                      ),
                    ),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.language_outlined,
                title: l10n.get('language') ?? 'Language',
                subtitle: l10n.get('languageDescription') ??
                    'English / Tiếng Việt',
                trailing: DropdownButton<String>(
                  value: languageProvider.currentLocale.languageCode,
                  onChanged: (String? newValue) {
                    if (newValue != null &&
                        newValue !=
                            languageProvider.currentLocale.languageCode) {
                      languageProvider.toggleLanguage();
                    }
                  },
                  items: <String>['en', 'vi']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == 'en' ? 'English' : 'Tiếng Việt'),
                    );
                  }).toList(),
                ),
                onTap: () {}, // No action needed on tap
              ),
              const Divider(),

              // About Section
              _buildSectionHeader(l10n.get('about') ?? 'About'),
              _buildListTile(
                icon: Icons.info_outline,
                title: l10n.get('aboutTheApp') ?? 'About The App',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen()),
                  );
                },
              ),
              _buildListTile(
                icon: Icons.group_outlined,
                title: l10n.get('aboutTheTeam') ?? 'About The Team',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutTeamScreen()),
                  );
                },
              ),
              const Divider(),

              // Logout
              _buildListTile(
                icon: Icons.logout,
                title: l10n.get('logout') ?? 'Logout',
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  _showLogoutDialog();
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    Color? iconColor,
    Color? textColor,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false, // Remove all previous routes
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
