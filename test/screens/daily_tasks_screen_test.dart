import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_forum_app/screens/daily_tasks_screen.dart';

void main() {
  testWidgets('DailyTasksScreen shows initial tasks', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: DailyTasksScreen()));

    // Verify that the title is correct.
    expect(find.text('Daily Tasks'), findsOneWidget);

    // Verify that the initial tasks are displayed.
    expect(find.text('Learn 10 new vocabulary words'), findsOneWidget);
    expect(find.text('Practice speaking for 15 minutes'), findsOneWidget);
    expect(find.text('Read one news article in English'), findsOneWidget);
  });

  testWidgets('Can add a new task', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: DailyTasksScreen()));

    // Enter text into the TextField.
    await tester.enterText(find.byType(TextField), 'Write a short story');

    // Tap the add button.
    await tester.tap(find.byIcon(Icons.add));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Verify that the new task is displayed.
    expect(find.text('Write a short story'), findsOneWidget);
  });
}
