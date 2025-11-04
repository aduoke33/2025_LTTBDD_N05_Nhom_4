import '../models/notification.dart';
import '../models/user.dart';

List<AppNotification> getExampleNotifications() {
  return [
    AppNotification(
      id: '1',
      fromUser: User(
        id: '2',
        name: 'Ha Nguyen',
        email: 'nguyenocc@example.com',
        avatarUrl:
            'english_forum_app/assets/images/2025_02_24_08_15_IMG_8618.JPG',
      ),
      type: NotificationType.like,
      message: 'liked your post',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      isRead: false,
    ),
    AppNotification(
      id: '2',
      fromUser: User(
        id: '3',
        name: 'Ngo Nhat dz',
        email: 'ngonhatdz123@example.com',
        avatarUrl:
            'english_forum_app/assets/images/2025_01_14_10_42_IMG_8124.PNG',
      ),
      type: NotificationType.comment,
      message: 'commented on your post',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isRead: false,
    ),
    AppNotification(
      id: '3',
      fromUser: User(
        id: '4',
        name: 'DuyHieu Vippro',
        email: 'duyhieudz@example.com',
        avatarUrl: 'english_forum_app/assets/images/2025_05_07_11_07_IMG_9225.PNG',
      ),
      type: NotificationType.follow,
      message: 'started following you',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: true,
    ),
  ];
}
