# Maboutik Localazy Demo

The completed app from the Flutter `easy_localization` guide, with English, French, German, and Arabic translations managed through Localazy.

## Run it

You’ll need Flutter and an Android device or emulator. From the `flutter-localazy-demo` directory, run the following commands.

```powershell
flutter pub get
flutter run
```

The translation files are included, so you don’t need Localazy credentials to run the app.

## Project structure

```text
lib/
  main.dart
  generated/
    locale_keys.g.dart
  src/
    app/
      maboutik_app.dart
    features/
      shop/
        maboutik_home_page.dart
        models/
          recipient_gender.dart
        widgets/
    theme/
    utils/
      app_spacing.dart
assets/
  translations/
    en.json
    fr.json
    de.json
    ar.json
  wireless-keyboard-2.jpg
test/
  widget_test.dart
```

Translations live in `assets/translations/`, with generated keys in `locale_keys.g.dart`. The shop screen connects them to the greeting, cart quantity, and recipient selection.

Switch languages to check the translated interface and Arabic layout. Your name, cart quantity, and selected recipient should stay the same during each switch.

## Check your changes

```powershell
flutter analyze
flutter test
```

The tests check that the product screen loads after entering a name and that the English cart message updates with the quantity. Check the other languages, text overflow, and RTL layout on a device.
