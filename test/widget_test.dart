import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial3/main.dart';
import 'package:tutorial3/screens/dashboard_page/dashboard_page_widget.dart';
import 'package:tutorial3/screens/login_page/login_page_model.dart';

void main() {
  testWidgets('empty credentials show validation error', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    await tester.tap(find.byKey(const Key('login_btn')));
    await tester.pump();

    expect(find.text('Username / Password is required'), findsOneWidget);
    expect(find.text('Dashboard'), findsNothing);
  });

  testWidgets('dashboard shows the name from login state', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loginPageModelProvider.overrideWithValue(
            const LoginPageState(firstName: 'Emily'),
          ),
        ],
        child: const MaterialApp(home: DashboardPage(title: 'Dashboard')),
      ),
    );

    expect(find.byKey(const Key('welcome_text')), findsOneWidget);
    expect(find.text('Welcome Emily'), findsOneWidget);
  });
}
