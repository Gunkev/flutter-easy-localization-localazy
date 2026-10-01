import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/app_spacing.dart';
import '../../../utils/app_strings.dart';
import '../models/recipient_gender.dart';
import 'product_visual.dart';
import 'quantity_stepper.dart';
import 'recipient_selector.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.quantity,
    required this.cartMessage,
    required this.selectedGender,
    required this.recommendation,
    required this.onGenderChanged,
    required this.onDecrease,
    required this.onIncrease,
  });

  final int quantity;
  final String cartMessage;
  final RecipientGender selectedGender;
  final String recommendation;
  final ValueChanged<RecipientGender> onGenderChanged;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(color: AppColors.softLine),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProductVisual(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.productName,
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  AppStrings.productDescription,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedText,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                RecipientSelector(
                  selectedGender: selectedGender,
                  onChanged: onGenderChanged,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  AppStrings.personalPickLabel,
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Semantics(
                  liveRegion: true,
                  child: Text(
                    recommendation,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppColors.mutedText,
                      height: 1.35,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Center(
                  child: QuantityStepper(
                    quantity: quantity,
                    onDecrease: onDecrease,
                    onIncrease: onIncrease,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      cartMessage,
                      key: ValueKey(cartMessage),
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.ink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
