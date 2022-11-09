// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loginunittest/view/login_view.dart';

import 'package:loginunittest/main.dart';

void main() {
  testWidgets('Button is present and triggers navigation after tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginView()));
    expect(find.byType(ElevatedButton), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    //how to test navigator?
  });
}
