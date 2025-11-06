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
      'english': 'English',
      'vietnamese': 'Vietnamese',
      'logout': 'Logout',
      'cancel': 'Cancel',
      'confirm_logout': 'Are you sure you want to logout?',
      'about': 'About',
      'about_team': 'About Team',

      // Main Navigation
      'nav_home': 'Home',
      'nav_search': 'Search',
      'nav_tasks': 'Tasks',
      'nav_notifications': 'Notifications',
      'nav_profile': 'Profile',

      // Login Screen
      'login_title': 'Login',
      'email_hint': 'Email',
      'password_hint': 'Password',
      'login_button': 'Login',
      'register_prompt': "Don't have an account? Register",

      // Profile Screen
      'profile_posts': 'Posts',
      'profile_followers': 'Followers',
      'profile_following': 'Following',
      'edit_profile': 'Edit Profile',
      'profile_saved': 'Saved',
      'profile_tagged': 'Tagged',

      // About Team Screen
      'about_team_title': 'About The Team',
      'project_info': 'Project Information',
      'course': 'Course',
      'course_name': 'Mobile Application Development',
      'university': 'University',
      'university_name': 'Phenikaa University',
      'team_members': 'Team Members',
      'member1_name': 'Ngo Dang Nhat Dung',
      'member1_id': 'ID: 23010329',
      'member2_name': 'Nguyen Duy Hieu',
      'member2_id': 'ID: 23010363',
    },
    'vi': {
      // General
      'settings': 'Cài đặt',
      'language': 'Ngôn ngữ',
      'english': 'Tiếng Anh',
      'vietnamese': 'Tiếng Việt',
      'logout': 'Đăng xuất',
      'cancel': 'Hủy',
      'confirm_logout': 'Bạn có chắc chắn muốn đăng xuất không?',
      'about': 'Về ứng dụng',
      'about_team': 'Về nhóm',

      // Main Navigation
      'nav_home': 'Trang chủ',
      'nav_search': 'Tìm kiếm',
      'nav_tasks': 'Nhiệm vụ',
      'nav_notifications': 'Thông báo',
      'nav_profile': 'Hồ sơ',

      // Login Screen
      'login_title': 'Đăng nhập',
      'email_hint': 'Email',
      'password_hint': 'Mật khẩu',
      'login_button': 'Đăng nhập',
      'register_prompt': 'Chưa có tài khoản? Đăng ký',

      // Profile Screen
      'profile_posts': 'Bài viết',
      'profile_followers': 'Người theo dõi',
      'profile_following': 'Đang theo dõi',
      'edit_profile': 'Chỉnh sửa hồ sơ',
      'profile_saved': 'Đã lưu',
      'profile_tagged': 'Được gắn thẻ',

      // About Team Screen
      'about_team_title': 'Về Nhóm Phát Triển',
      'project_info': 'Thông Tin Dự Án',
      'course': 'Môn học',
      'course_name': 'Lập trình trên thiết bị di động',
      'university': 'Trường',
      'university_name': 'Đại học Phenikaa',
      'team_members': 'Thành Viên Nhóm',
      'member1_name': 'Ngô Đặng Nhật Dũng',
      'member1_id': 'MSV: 23010329',
      'member2_name': 'Nguyễn Duy Hiệu',
      'member2_id': 'MSV: 23010363',
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
