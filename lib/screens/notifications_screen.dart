import 'package:english_forum_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../models/notification.dart';
import '../repositories/example_notification.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<AppNotification> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = getExampleNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.get('notifications') ?? 'Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: l10n.get('markAllAsRead') ?? 'Mark all as read',
            onPressed: () {},
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Text(
                l10n.get('noNotificationsYet') ?? 'No notifications yet',
              ),
            )
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      notification.fromUser.avatarUrl,
                    ),
                  ),
                  title: Text(
                    '${notification.fromUser.name} ${notification.message}',
                  ),
                  subtitle: Text(notification.timestamp.toString()),
                );
              },
            ),
    );
  }
}
