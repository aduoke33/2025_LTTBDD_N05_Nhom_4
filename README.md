# English Forum App

Ứng dụng diễn đàn học tiếng Anh cho người mới bắt đầu.

## Yêu cầu hệ thống

- **Flutter SDK**: 3.9.2 hoặc cao hơn
- **Dart SDK**: 3.9.2 hoặc cao hơn
- **Android Studio** hoặc **Visual Studio Code**
- **Git**

### Kiểm tra phiên bản Flutter:

```bash
flutter --version
```

Nếu chưa cài đặt Flutter, tải tại: https://flutter.dev/docs/get-started/install

## Hướng dẫn cài đặt

### 1. Clone dự án

```bash
git clone https://github.com/aduoke33/2025_LTTBDD_N05_Nhom_4.git
cd english_forum_app
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

**Lưu ý:** Nếu gặp lỗi, thử:

```bash
flutter clean
flutter pub get
```

### 3. Kiểm tra thiết bị

```bash
flutter devices
```

### 4. Chạy ứng dụng

```bash
flutter run
```

Hoặc chọn thiết bị cụ thể:

```bash
flutter run -d chrome        # Web
flutter run -d windows       # Windows
flutter run -d emulator-xxxx # Android Emulator
```

## Xử lý lỗi thường gặp

### Lỗi: "Flutter SDK not found"

**Nguyên nhân:** Chưa cài đặt Flutter hoặc chưa thêm vào PATH

**Giải pháp:**

1. Cài đặt Flutter: https://flutter.dev/docs/get-started/install
2. Thêm Flutter vào PATH
3. Chạy: `flutter doctor` để kiểm tra

### Lỗi: "Dart SDK version conflict"

**Nguyên nhân:** Phiên bản Flutter không tương thích

**Giải pháp:**

```bash
flutter upgrade
flutter pub get
```

### Lỗi: "Could not find a file named 'pubspec.yaml'"

**Nguyên nhân:** Đang ở sai thư mục

**Giải pháp:**

```bash
cd english_forum_app  # Đảm bảo ở đúng thư mục dự án
ls                    # Xem có file pubspec.yaml không
```

### Lỗi: "pub get failed"

**Nguyên nhân:** Lỗi network hoặc cache

**Giải pháp:**

```bash
flutter clean
flutter pub cache repair
flutter pub get
```

### Lỗi: "No connected devices"

**Nguyên nhân:** Không có thiết bị/emulator nào

**Giải pháp:**

- **Android:** Mở Android Studio → AVD Manager → Tạo emulator
- **Web:** Chạy `flutter run -d chrome`
- **Windows:** Chạy `flutter run -d windows`

### Lỗi: "Gradle build failed" (Android)

**Giải pháp:**

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

### Lỗi: "CocoaPods not installed" (iOS/macOS)

**Giải pháp:**

```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
flutter run
```

## Chạy trên các nền tảng

### Android

```bash
flutter run -d android
```

### iOS (chỉ trên macOS)

```bash
flutter run -d ios
```

### Web

```bash
flutter run -d chrome
```

### Windows

```bash
flutter run -d windows
```

## Dependencies

Dự án sử dụng các package sau:

- `flutter_localizations` - Hỗ trợ đa ngôn ngữ
- `provider` ^6.1.5+1 - State management
- `share_plus` ^10.1.3 - Chia sẻ nội dung
- `shared_preferences` ^2.3.4 - Lưu trữ local
- `path_provider` ^2.1.5 - Quản lý file path

## Cấu trúc dự án

```
lib/
├── main.dart                 # Entry point
├── l10n/                     # Localization
│   ├── app_localizations.dart
│   └── language_provider.dart
├── models/                   # Data models
├── screens/                  # UI screens
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── learn_screen.dart     # Màn hình học (Flashcard + Tasks)
│   └── ...
└── repositories/             # Data layer
```

## Tính năng

- **Đa ngôn ngữ**: Tiếng Anh / Tiếng Việt
- **Flashcard**: Học từ vựng với flashcards
- **Daily Tasks**: Quản lý nhiệm vụ hàng ngày
- **Forum**: Đăng bài, bình luận, thích
- **Profile**: Quản lý tài khoản cá nhân

## Debug

### Bật debug mode:

```bash
flutter run --debug
```

### Xem logs:

```bash
flutter logs
```

### Kiểm tra performance:

```bash
flutter run --profile
```

## Ghi chú quan trọng

1. **Lần đầu chạy:** Có thể mất vài phút để download dependencies và build
2. **Hot Reload:** Nhấn `r` trong terminal để reload nhanh
3. **Hot Restart:** Nhấn `R` để restart app
4. **Thoát:** Nhấn `q` để thoát

## Nhóm phát triển

- Nhóm 4 - Lập trình thiết bị di động
- Năm 2025

## Hỗ trợ

Nếu gặp vấn đề, hãy:

1. Chạy `flutter doctor` và kiểm tra cài đặt
2. Đảm bảo đã chạy `flutter pub get`
3. Thử `flutter clean` và build lại

## License

Copyright © 2025
