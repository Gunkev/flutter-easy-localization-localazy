import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/app_strings.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onDecrease,
    required this.onIncrease,
  });

  final int quantity;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FA),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _QuantityButton(
              icon: Icons.remove,
              tooltip: AppStrings.decreaseQuantityTooltip,
              onPressed: quantity == 0 ? null : onDecrease,
            ),
            SizedBox(
              width: 64,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: Text(
                  '$quantity',
                  key: ValueKey(quantity),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.ink,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            _QuantityButton(
              icon: Icons.add,
              tooltip: AppStrings.increaseQuantityTooltip,
              onPressed: onIncrease,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.teal,
        disabledBackgroundColor: const Color(0xFFD9E1EA),
        foregroundColor: Colors.white,
        disabledForegroundColor: AppColors.mutedText,
        fixedSize: const Size.square(48),
      ),
      icon: Icon(icon),
    );
  }
}
