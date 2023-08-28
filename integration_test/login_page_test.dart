// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tutorial3/main.dart';

import 'test_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('App Login with welcome page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // FlutterError.onError = ignoreOverflowErrors;
    await tester.pumpWidget(const MyApp());
    var usernameFind = find.byKey(const Key("username_text"));
    var passwordFind = find.byKey(const Key("password_text"));
    var loginBtnFind = find.byKey(const Key("login_btn"));
    
    expect(usernameFind, findsOneWidget);
    expect(passwordFind, findsOneWidget);
    expect(loginBtnFind, findsOneWidget);

    await tester.enterText(usernameFind, "atuny0");
    await tester.enterText(passwordFind, "9uQFF1Lh");

    await tester.tap(loginBtnFind);

    await tester.pumpAndSettle(const Duration(seconds: 3));
    var welcomeFind= find.textContaining("Logout");

    expect(welcomeFind, findsOneWidget);
  });
}
