import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_forum_app/screens/daily_tasks_screen.dart';

void main() {
  testWidgets('DailyTasksScreen displays title and initial tasks', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: DailyTasksScreen()));

    // Verify the app bar title is displayed
    expect(find.text('Daily Tasks'), findsOneWidget);

    // Verify the initial tasks are displayed
    expect(find.text('Complete Math Assignment'), findsOneWidget);
    expect(find.text('Read Chapter 3 of History book'), findsOneWidget);
  });
}
