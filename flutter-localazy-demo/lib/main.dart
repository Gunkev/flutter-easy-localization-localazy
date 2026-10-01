import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'src/app/maboutik_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('de'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      ignorePluralRules: false,
      child: const MaboutikApp(),
    ),
  );
}
