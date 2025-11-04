import '../models/question.dart';

List<Question> getExampleQuestions() {
  return [
    Question(
      id: '1',
      question: 'How do I create a new post?',
      answer:
          'To create a new post, go to the home screen and tap the "+" button at the bottom. You can add text content and optionally include an image by providing an image URL.',
      category: 'Posts',
    ),
    Question(
      id: '2',
      question: 'How do I edit my profile?',
      answer:
          'Navigate to your profile by tapping the profile icon in the bottom navigation. Then tap the "Edit Profile" button. You can update your name, bio, and profile picture.',
      category: 'Account',
    ),
    Question(
      id: '3',
      question: 'How do I change my password?',
      answer:
          'Go to Settings from your profile screen, then tap "Change Password". Enter your current password and then your new password twice to confirm.',
      category: 'Security',
    ),
  ];
}
