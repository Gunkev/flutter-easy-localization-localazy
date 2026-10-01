import 'package:maboutik_starter/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/app_spacing.dart';
import '../models/recipient_gender.dart';

class RecipientSelector extends StatelessWidget {
  const RecipientSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  final RecipientGender selectedGender;
  final ValueChanged<RecipientGender> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.gender_label),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.ink,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        LayoutBuilder(
          builder: (context, constraints) {
            final useVerticalLayout =
                constraints.maxWidth < 260 ||
                MediaQuery.textScalerOf(context).scale(14) > 21;

            return SegmentedButton<RecipientGender>(
              direction: useVerticalLayout ? Axis.vertical : Axis.horizontal,
              expandedInsets: useVerticalLayout ? null : EdgeInsets.zero,
              showSelectedIcon: false,
              style: SegmentedButton.styleFrom(
                foregroundColor: AppColors.ink,
                backgroundColor: AppColors.surface,
                selectedForegroundColor: AppColors.ink,
                selectedBackgroundColor: AppColors.amber,
                minimumSize: const Size(48, 48),
                side: const BorderSide(color: AppColors.mutedText),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              segments: [
                ButtonSegment(
                  value: RecipientGender.male,
                  label: Text(context.tr(LocaleKeys.gender, gender: 'male')),
                ),
                ButtonSegment(
                  value: RecipientGender.female,
                  label: Text(context.tr(LocaleKeys.gender, gender: 'female')),
                ),
                ButtonSegment(
                  value: RecipientGender.other,
                  label: Text(context.tr(LocaleKeys.gender, gender: 'other')),
                ),
              ],
              selected: {selectedGender},
              onSelectionChanged: (selection) => onChanged(selection.single),
            );
          },
        ),
      ],
    );
  }
}
