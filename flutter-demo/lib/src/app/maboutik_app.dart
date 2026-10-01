import 'package:flutter/material.dart';

import '../features/shop/maboutik_home_page.dart';
import '../theme/app_theme.dart';
import '../utils/app_strings.dart';

class MaboutikApp extends StatelessWidget {
  const MaboutikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light(),
      home: const MaboutikHomePage(),
    );
  }
}
