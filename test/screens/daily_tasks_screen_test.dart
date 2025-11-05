import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_forum_app/screens/daily_tasks_screen.dart';

void main() {
  testWidgets('DailyTasksScreen shows initial tasks', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: DailyTasksScreen()));

    // Verify that the title is correct.
    expect(find.text('Daily Tasks'), findsOneWidget);

    // Verify that the initial tasks are displayed.
    expect(find.text('Learn 10 new vocabulary words'), findsOneWidget);
    expect(find.text('Practice speaking for 15 minutes'), findsOneWidget);
    expect(find.text('Read one news article in English'), findsOneWidget);
  });
}