import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class ProductVisual extends StatelessWidget {
  const ProductVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.55,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/wireless-keyboard-2.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.midnight.withValues(alpha: 0.12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
