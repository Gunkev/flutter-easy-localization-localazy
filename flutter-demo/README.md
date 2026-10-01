# Maboutik Flutter Starter

A small shopping app for the Flutter `easy_localization` guide. It starts in English, ready for you to add localization and connect it to Localazy.

## Run it

You’ll need Flutter and an Android device or emulator. Only the Android runner is included.

From the `flutter-demo` directory, run the following commands.

```powershell
flutter pub get
flutter run
```

## Project structure

```bash
lib/
  main.dart
  src/
    app/
      maboutik_app.dart
    features/
      shop/
        maboutik_home_page.dart
        models/
          recipient_gender.dart
        widgets/
          language_selector.dart
          loading_view.dart
          maboutik_app_bar.dart
          name_prompt_dialog.dart
          product_card.dart
          product_visual.dart
          quantity_stepper.dart
          recipient_selector.dart
    theme/
      app_colors.dart
      app_theme.dart
    utils/
      app_spacing.dart
      app_strings.dart
test/
  widget_test.dart
assets/
  wireless-keyboard-2.jpg
```

Start with `maboutik_home_page.dart` to see how the screen and its widgets fit together. The English labels and messages live in `app_strings.dart`. You’ll move them into JSON as you follow the guide, then add French, German, Arabic, and locale switching.

## Check your changes

```powershell
flutter analyze
flutter test
```

The tests check that the product screen loads after entering a name and that the cart message updates with the quantity. Once you add localization, update their setup and expected text to match.
