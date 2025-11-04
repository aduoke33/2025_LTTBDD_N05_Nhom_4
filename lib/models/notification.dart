import 'package:english_forum_app/models/user.dart';

enum NotificationType { like, comment, follow }

class AppNotification {
  final String id;
  final User fromUser;
  final NotificationType type;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  AppNotification({
    required this.id,
    required this.fromUser,
    required this.type,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });
}
