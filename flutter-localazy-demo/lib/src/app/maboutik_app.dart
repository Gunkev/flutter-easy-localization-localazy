import 'package:maboutik_starter/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../features/shop/maboutik_home_page.dart';
import '../theme/app_theme.dart';

class MaboutikApp extends StatelessWidget {
  const MaboutikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => context.tr(LocaleKeys.app_name),
      theme: AppTheme.light(),
      home: const MaboutikHomePage(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
