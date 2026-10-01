import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../utils/app_spacing.dart';
import '../../../utils/app_strings.dart';

class NamePromptDialog extends StatefulWidget {
  const NamePromptDialog({super.key});

  @override
  State<NamePromptDialog> createState() => _NamePromptDialogState();
}

class _NamePromptDialogState extends State<NamePromptDialog> {
  final TextEditingController _nameController = TextEditingController();

  bool get _canSubmit => _nameController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submitName() {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      return;
    }

    Navigator.of(context).pop(name);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      title: const Text(AppStrings.namePromptTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.namePromptDescription),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _nameController,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: AppStrings.nameInputLabel,
              border: OutlineInputBorder(),
            ),
            onChanged: (_) => setState(() {}),
            onSubmitted: (_) => _submitName(),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: _canSubmit ? _submitName : null,
          child: const Text(AppStrings.namePromptAction),
        ),
      ],
    );
  }
}
