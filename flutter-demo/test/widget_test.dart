import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maboutik_starter/src/features/shop/maboutik_home_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: MaboutikHomePage(loadingDuration: Duration(milliseconds: 1)),
    );
  }

  Future<void> enterUserName(WidgetTester tester, String name) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    final input = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byType(TextField),
    );
    await tester.enterText(input, name);
    await tester.pump();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the Maboutik product screen after loading', (
    tester,
  ) async {
    await enterUserName(tester, 'Faya');

    expect(find.text('Maboutik'), findsOneWidget);
    expect(find.text('English'), findsWidgets);
    expect(find.text('Welcome back, Faya'), findsOneWidget);
    expect(find.text('Wireless Keyboard'), findsOneWidget);
    expect(
      find.text('Compact mechanical keyboard for daily work.'),
      findsOneWidget,
    );
    expect(find.text('You have no items in your cart'), findsOneWidget);
  });

  testWidgets('updates the cart message as quantity changes', (tester) async {
    await enterUserName(tester, 'Faya');
    await tester.ensureVisible(find.byTooltip('Add one item'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Add one item'));
    await tester.pumpAndSettle();
    expect(find.text('You have 1 item in your cart'), findsOneWidget);

    await tester.tap(find.byTooltip('Add one item'));
    await tester.pumpAndSettle();
    expect(find.text('You have 2 items in your cart'), findsOneWidget);

    await tester.tap(find.byTooltip('Remove one item'));
    await tester.pumpAndSettle();
    expect(find.text('You have 1 item in your cart'), findsOneWidget);
  });
}
