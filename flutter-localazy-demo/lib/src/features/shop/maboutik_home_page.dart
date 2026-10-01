import 'package:maboutik_starter/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/app_spacing.dart';
import 'models/recipient_gender.dart';
import 'widgets/language_selector.dart';
import 'widgets/loading_view.dart';
import 'widgets/maboutik_app_bar.dart';
import 'widgets/name_prompt_dialog.dart';
import 'widgets/product_card.dart';

class MaboutikHomePage extends StatefulWidget {
  const MaboutikHomePage({
    super.key,
    this.loadingDuration = const Duration(milliseconds: 700),
  });

  final Duration loadingDuration;

  @override
  State<MaboutikHomePage> createState() => _MaboutikHomePageState();
}

class _MaboutikHomePageState extends State<MaboutikHomePage> {
  Timer? _loadingTimer;
  bool _isLoading = true;
  int _quantity = 0;
  RecipientGender _selectedGender = RecipientGender.other;
  String _userName = '';
  bool _hasPromptedForName = false;

  @override
  void initState() {
    super.initState();
    _loadingTimer = Timer(widget.loadingDuration, () {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showNamePrompt();
      });
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  void _increaseQuantity() {
    setState(() {
      _quantity += 1;
    });
  }

  void _decreaseQuantity() {
    if (_quantity == 0) {
      return;
    }

    setState(() {
      _quantity -= 1;
    });
  }

  Future<void> _showNamePrompt() async {
    if (_hasPromptedForName || !mounted) {
      return;
    }

    _hasPromptedForName = true;

    final name = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const NamePromptDialog(),
    );

    if (!mounted || name == null) {
      return;
    }

    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingView();
    }

    return Scaffold(
      appBar: const MaboutikAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.xl,
          ),
          children: [
            const SizedBox(height: AppSpacing.sm),
            LanguageSelector(
              selectedLocale: context.locale,
              onChanged: (locale) async {
                await context.setLocale(locale);
              },
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              _userName.trim().isEmpty
                  ? context.tr(LocaleKeys.app_welcomeFallback)
                  : context.tr(
                      LocaleKeys.app_welcome,
                      namedArgs: {'userName': _userName.trim()},
                    ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ProductCard(
              quantity: _quantity,
              cartMessage: context.plural(
                LocaleKeys.cart_items,
                _quantity,
                name: 'count',
              ),
              selectedGender: _selectedGender,
              recommendation: context.tr(
                LocaleKeys.product_recommendation,
                gender: _selectedGender.name,
              ),
              onGenderChanged: (gender) {
                setState(() {
                  _selectedGender = gender;
                });
              },
              onDecrease: _decreaseQuantity,
              onIncrease: _increaseQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
