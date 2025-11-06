import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:english_forum_app/screens/daily_tasks_screen.dart';
import 'package:english_forum_app/screens/home_screen.dart';
import 'package:english_forum_app/screens/notifications_screen.dart';
import 'package:english_forum_app/screens/profile_screen.dart';
import 'package:english_forum_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<Widget> widgetOptions = <Widget>[
      const HomeScreen(),
      const SearchScreen(),
      const DailyTasksScreen(),
      const NotificationsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Center(child: widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.get('nav_home') ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: l10n.get('nav_search') ?? 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task_alt), // Icon cho Daily Tasks
            label: l10n.get('nav_tasks') ?? 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: l10n.get('nav_notifications') ?? 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: l10n.get('nav_profile') ?? 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType
            .fixed, // Quan trọng để hiển thị tất cả label
      ),
    );
  }
}
