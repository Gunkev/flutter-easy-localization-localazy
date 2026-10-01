import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/app_strings.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  final String selectedLanguage;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                AppStrings.languageSelectorLabel,
                style: TextStyle(
                  color: AppColors.amber,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                ),
              ),
            ),
            DropdownMenu<String>(
              width: 280,
              initialSelection: selectedLanguage,
              leadingIcon: const Icon(Icons.language),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppColors.softLine),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: AppColors.amber,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              textStyle: const TextStyle(
                color: AppColors.ink,
                fontWeight: FontWeight.w700,
              ),
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: 'en',
                  label: AppStrings.englishLanguage,
                ),
              ],
              onSelected: (language) {
                if (language != null) {
                  onChanged(language);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
