import 'package:maboutik_starter/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.selectedLocale,
    required this.onChanged,
  });

  final Locale selectedLocale;
  final ValueChanged<Locale> onChanged;

  @override
  Widget build(BuildContext context) {
    final languageLabels = {
      const Locale('en'): context.tr(LocaleKeys.language_english),
      const Locale('fr'): context.tr(LocaleKeys.language_french),
      const Locale('de'): context.tr(LocaleKeys.language_german),
      const Locale('ar'): context.tr(LocaleKeys.language_arabic),
    };
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, bottom: 8),
              child: Text(
                context.tr(LocaleKeys.language_label),
                style: const TextStyle(
                  color: AppColors.amber,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0,
                ),
              ),
            ),
            DropdownMenu<Locale>(
              key: ValueKey(selectedLocale),
              width: 280,
              initialSelection: selectedLocale,
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
              dropdownMenuEntries: [
                for (final locale in context.supportedLocales)
                  DropdownMenuEntry(
                    value: locale,
                    label: languageLabels[locale] ?? locale.toLanguageTag(),
                  ),
              ],
              onSelected: (locale) {
                if (locale != null) {
                  onChanged(locale);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
