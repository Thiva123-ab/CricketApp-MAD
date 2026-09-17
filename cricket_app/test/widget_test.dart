// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:cricket_app/main.dart';

void main() {
  testWidgets('MiniCricketApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiniCricketApp());

    // Verify that our game starts with 6 balls and 0 runs.
    expect(find.text('Runs'), findsOneWidget);
    expect(find.text('Balls'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });
}
