import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maboutik_starter/src/features/shop/maboutik_home_page.dart';

class TestTranslations extends AssetLoader {
  const TestTranslations();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async =>
      jsonDecode(File('$path/${locale.languageCode}.json').readAsStringSync())
          as Map<String, dynamic>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/shared_preferences'),
          (call) async => call.method == 'getAll' ? <String, Object>{} : true,
        );
    await EasyLocalization.ensureInitialized();
  });

  Widget buildTestApp() {
    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      path: 'assets/translations',
      useOnlyLangCode: true,
      ignorePluralRules: false,
      saveLocale: false,
      assetLoader: const TestTranslations(),
      child: Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: const MaboutikHomePage(
            loadingDuration: Duration(milliseconds: 1),
          ),
        ),
      ),
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
    expect(find.text('You have 0 items in your cart'), findsOneWidget);
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
