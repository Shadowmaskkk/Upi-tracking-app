import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temp_app/main.dart'; // Adjust based on your pubspec.yaml name

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FinancialPulseApp());

    // Verify that our title is present.
    expect(find.text('Good Afternoon 👋'), findsOneWidget);
  });
}
