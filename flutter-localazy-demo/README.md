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
  localization_test.dart
  goldens/
    cart_en.png
    cart_fr.png
```

Translations live in `assets/translations/`, with generated keys in `locale_keys.g.dart`. The shop screen connects them to the greeting, cart quantity, and recipient selection.

Switch languages to check the translated interface and Arabic layout. Your name, cart quantity, and selected recipient should stay the same during each switch.

## Check your changes

```powershell
flutter analyze
flutter test
```

The tests cover the product screen, cart controls, and the empty-cart message in English and French. The localization test also compares two small golden images, using Flutter's default test font rather than the app's fonts. Check real typography, the other languages, and RTL layout on a device.

To run just the test from the guide, use `flutter test test/localization_test.dart`. After an intentional change, generate new baselines with `flutter test --update-goldens test/localization_test.dart`, inspect the images in `test/goldens/`, and commit them with the test. Keep the Flutter version and operating system consistent when comparing goldens.
