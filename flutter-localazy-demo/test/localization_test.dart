import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maboutik_starter/generated/locale_keys.g.dart';

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

  const messages = {
    'en': 'You have 0 items in your cart',
    'fr': 'Tu as 0 article dans ton panier',
  };

  for (final entry in messages.entries) {
    testWidgets('empty cart in ${entry.key}', (tester) async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('fr')],
          startLocale: Locale(entry.key),
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
              home: Builder(
                builder: (context) => Scaffold(
                  body: Center(
                    child: RepaintBoundary(
                      key: const Key('cart-message'),
                      child: Container(
                        width: 280,
                        color: Colors.white,
                        child: Text(
                          context.plural(
                            LocaleKeys.cart_items,
                            0,
                            name: 'count',
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(entry.value), findsOneWidget);
      expect(tester.takeException(), isNull);
      await expectLater(
        find.byKey(const Key('cart-message')),
        matchesGoldenFile('goldens/cart_${entry.key}.png'),
      );
    });
  }
}
