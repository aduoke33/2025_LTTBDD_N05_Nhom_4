import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_forum_app/screens/about_screen.dart';

void main() {
  testWidgets('AboutScreen shows correct title and message', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: AboutScreen()));

    // Verify that the title is correct.
    expect(find.text('About'), findsOneWidget);

    // Verify that the message is displayed.
    expect(
      find.text(
        'This is an application for English communication and learning.',
      ),
      findsOneWidget,
    );
  });
}
