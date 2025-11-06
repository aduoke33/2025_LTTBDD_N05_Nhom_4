import 'package:flutter/material.dart';
import 'dart:async';

// Lớp chứa tất cả các chuỗi văn bản của ứng dụng
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper để truy cập từ context
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Delegate để load bản dịch
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Map chứa tất cả các bản dịch
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // General
      'settings': 'Settings',
      'language': 'Language',
      'languageDescription': 'English / Tiếng Việt',
      'english': 'English',
      'vietnamese': 'Vietnamese',
      'logout': 'Logout',
      'cancel': 'Cancel',
      'confirm_logout': 'Are you sure you want to logout?',
      'about': 'About',
      'aboutTheApp': 'About The App',
      'aboutTheTeam': 'About The Team',
      'appDescription':
          'This is an application for English communication and learning.\n\n',
      'post': 'Post',

      // Main Navigation
      'home': 'Home',
      'search': 'Search',
      'tasks': 'Tasks',
      'notifications': 'Notifications',
      'profile': 'Profile',
      'nav_home': 'Home',
      'nav_search': 'Search',
      'nav_tasks': 'Tasks',
      'nav_notifications': 'Notifications',
      'nav_profile': 'Profile',

      // Login Screen
      'welcome': 'Welcome',
      'loginTitle': 'Login',
      'welcomeMessage': 'Log in to continue',
      'email': 'Email',
      'emailHint': 'Enter your email',
      'password': 'Password',
      'passwordHint': 'Enter your password',
      'forgotPassword': 'Forgot Password?',
      'login': 'Login',
      'dontHaveAccount': "Don't have an account?",
      'register': 'Register',

      // Register Screen
      'createAccount': 'Create Account',
      'getStarted': 'Get Started',
      'createAccountMessage': 'Create your account to continue',
      'fullName': 'Full Name',
      'fullNameHint': 'Enter your full name',
      'enterYourEmail': 'Enter your email',
      'enterYourPassword': 'Enter your password',
      'confirmPassword': 'Confirm Password',
      'confirmPasswordHint': 'Re-enter your password',
      'agreeToTerms': 'I agree to the Terms & Conditions',
      'alreadyHaveAccount': 'Already have an account?',

      // Home Screen
      'englishForum': 'English Forum',
      'createPost': 'Create Post',
      'whatsOnYourMind': "What's on your mind?",
      'pasteImageUrl': 'Paste image URL (optional)',
      'imageUrl': 'Image URL',

      // Profile Screen
      'posts': 'Posts',
      'followers': 'Followers',
      'following': 'Following',
      'editProfile': 'Edit Profile',
      'saved': 'Saved',
      'tagged': 'Tagged',
      'noPostsYet': 'No posts yet',
      'likes': 'likes',
      'comments': 'comments',
      'editProfileComingSoon': 'Edit profile coming soon',
      'savedPostsComingSoon': 'Saved posts feature coming soon',
      'taggedPostsComingSoon': 'Tagged posts feature coming soon',

      // Settings Screen
      'account': 'Account',
      'changePassword': 'Change Password',
      'privateAccount': 'Private Account',
      'privateAccountDescription': 'Only followers can see your posts',
      'appearance': 'Appearance',
      'darkMode': 'Dark Mode',
      'darkModeDescription': 'Enable dark theme',
      'pushNotifications': 'Push Notifications',
      'pushNotificationsDescription': 'Receive push notifications',
      'emailNotifications': 'Email Notifications',
      'emailNotificationsDescription': 'Manage email preferences',

      // Search Screen
      'searchPostsUsers': 'Search posts, users...',
      'all': 'All',
      'users': 'Users',
      'recent': 'Recent',
      'people': 'People',
      'videos': 'Videos',
      'noResultsFound': 'No results found',
      'searchForSomething': 'Search to get started',
      'trySearchingForSomethingElse': 'Try searching for something else',

      // Help Screen
      'helpAndSupport': 'Help & Support',
      'searchForHelp': 'Search for help...',
      'emailUs': 'Email Us',
      'liveChat': 'Live Chat',
      'callUs': 'Call Us',
      'frequentlyAskedQuestions': 'Frequently Asked Questions',

      // Notifications Screen
      'noNotifications': 'No notifications yet',
      'notificationsWillAppear': 'Your notifications will appear here',

      // Daily Tasks Screen
      'dailyTasks': 'Daily Tasks',
      'addNewTask': 'Add a new task...',
      'defaultTask1': 'Learn 10 new vocabulary words',
      'defaultTask2': 'Practice speaking for 15 minutes',
      'defaultTask3': 'Read one news article in English',

      // About Team Screen
      'projectInfo': 'Project Information',
      'course': 'Course',
      'courseName': 'Mobile Application Development',
      'university': 'University',
      'universityName': 'Phenikaa University',
      'teamMembers': 'Team Members',
      'member1Name': 'Ngo Dang Nhat Dung',
      'member1Id': 'ID: 23010329',
      'member2Name': 'Nguyen Duy Hieu',
      'member2Id': 'ID: 23010363',
    },
    'vi': {
      // General
      'settings': 'Cài đặt',
      'language': 'Ngôn ngữ',
      'languageDescription': 'English / Tiếng Việt',
      'english': 'Tiếng Anh',
      'vietnamese': 'Tiếng Việt',
      'logout': 'Đăng xuất',
      'cancel': 'Hủy',
      'confirm_logout': 'Bạn có chắc chắn muốn đăng xuất không?',
      'about': 'Về ứng dụng',
      'aboutTheApp': 'Về Ứng Dụng',
      'aboutTheTeam': 'Về Nhóm Phát Triển',
      'appDescription':
          'Đây là ứng dụng dành cho giao tiếp và học tiếng Anh.\n\n',
      'post': 'Đăng',

      // Main Navigation
      'home': 'Trang chủ',
      'search': 'Tìm kiếm',
      'tasks': 'Nhiệm vụ',
      'notifications': 'Thông báo',
      'profile': 'Hồ sơ',
      'nav_home': 'Trang chủ',
      'nav_search': 'Tìm kiếm',
      'nav_tasks': 'Nhiệm vụ',
      'nav_notifications': 'Thông báo',
      'nav_profile': 'Hồ sơ',

      // Login Screen
      'welcome': 'Chào mừng',
      'loginTitle': 'Đăng nhập',
      'welcomeMessage': 'Đăng nhập để tiếp tục',
      'email': 'Email',
      'emailHint': 'Nhập email của bạn',
      'password': 'Mật khẩu',
      'passwordHint': 'Nhập mật khẩu của bạn',
      'forgotPassword': 'Quên mật khẩu?',
      'login': 'Đăng nhập',
      'dontHaveAccount': 'Chưa có tài khoản?',
      'register': 'Đăng ký',

      // Register Screen
      'createAccount': 'Tạo Tài Khoản',
      'getStarted': 'Bắt Đầu',
      'createAccountMessage': 'Tạo tài khoản của bạn để tiếp tục',
      'fullName': 'Họ và tên',
      'fullNameHint': 'Nhập họ và tên của bạn',
      'enterYourEmail': 'Nhập email của bạn',
      'enterYourPassword': 'Nhập mật khẩu của bạn',
      'confirmPassword': 'Xác nhận mật khẩu',
      'confirmPasswordHint': 'Nhập lại mật khẩu của bạn',
      'agreeToTerms': 'Tôi đồng ý với Điều khoản & Điều kiện',
      'alreadyHaveAccount': 'Đã có tài khoản?',

      // Home Screen
      'The English Forum': 'The English Forum',
      'createPost': 'Tạo Bài Viết',
      'whatsOnYourMind': 'Bạn đang nghĩ gì?',
      'pasteImageUrl': 'Dán URL hình ảnh (tùy chọn)',
      'imageUrl': 'URL hình ảnh',

      // Profile Screen
      'posts': 'Bài viết',
      'followers': 'Người theo dõi',
      'following': 'Đang theo dõi',
      'editProfile': 'Chỉnh sửa hồ sơ',
      'saved': 'Đã lưu',
      'tagged': 'Được gắn thẻ',
      'noPostsYet': 'Chưa có bài viết',
      'likes': 'lượt thích',
      'comments': 'bình luận',
      'editProfileComingSoon': 'Tính năng chỉnh sửa hồ sơ sắp ra mắt',
      'savedPostsComingSoon': 'Tính năng bài viết đã lưu sắp ra mắt',
      'taggedPostsComingSoon': 'Tính năng bài viết được gắn thẻ sắp ra mắt',

      // Settings Screen
      'account': 'Tài khoản',
      'changePassword': 'Đổi mật khẩu',
      'privateAccount': 'Tài khoản riêng tư',
      'privateAccountDescription': 'Chỉ người theo dõi mới xem được bài viết',
      'appearance': 'Giao diện',
      'darkMode': 'Chế độ tối',
      'darkModeDescription': 'Bật chế độ tối',
      'pushNotifications': 'Thông báo đẩy',
      'pushNotificationsDescription': 'Nhận thông báo đẩy',
      'emailNotifications': 'Thông báo email',
      'emailNotificationsDescription': 'Quản lý tùy chọn email',

      // Search Screen
      'searchPostsUsers': 'Tìm kiếm bài viết, người dùng...',
      'all': 'Tất cả',
      'users': 'Người dùng',
      'recent': 'Gần đây',
      'people': 'Người',
      'videos': 'Video',
      'noResultsFound': 'Không tìm thấy kết quả',
      'searchForSomething': 'Tìm kiếm để bắt đầu',
      'trySearchingForSomethingElse': 'Thử tìm kiếm nội dung khác',

      // Help Screen
      'helpAndSupport': 'Trợ Giúp & Hỗ Trợ',
      'searchForHelp': 'Tìm kiếm trợ giúp...',
      'emailUs': 'Gửi Email',
      'liveChat': 'Trò Chuyện Trực Tuyến',
      'callUs': 'Gọi Cho Chúng Tôi',
      'frequentlyAskedQuestions': 'Câu Hỏi Thường Gặp',

      // Notifications Screen
      'noNotifications': 'Chưa có thông báo',
      'notificationsWillAppear': 'Thông báo của bạn sẽ xuất hiện ở đây',

      // Daily Tasks Screen
      'dailyTasks': 'Nhiệm Vụ Hàng Ngày',
      'addNewTask': 'Thêm nhiệm vụ mới...',

      // About Team Screen
      'projectInfo': 'Thông Tin Dự Án',
      'course': 'Môn học',
      'courseName': 'Lập trình trên thiết bị di động',
      'university': 'Trường',
      'universityName': 'Đại học Phenikaa',
      'teamMembers': 'Thành Viên Nhóm',
      'member1Name': 'Ngô Đặng Nhật Dũng',
      'member1Id': 'MSV: 23010329',
      'member2Name': 'Nguyễn Duy Hiệu',
      'member2Id': 'MSV: 23010363',
    },
  };

  // Phương thức để lấy chuỗi dịch
  String? get(String key) {
    return _localizedValues[locale.languageCode]?[key];
  }
}

// Delegate class
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// Extension để truy cập dễ dàng hơn: context.l10n.some_key
extension AppLocalizationsExtension on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
