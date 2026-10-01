# Flutter Localization with easy_localization and Localazy
Flutter localization tutorial with easy_localization and Localazy. It includes a starter app and completed demo with JSON translations, plurals, language switching, and Arabic RTL support.

## Choose a project

- **flutter-demo** is the starter. Use it to follow the guide.
- **flutter-localazy-demo** is the completed app, with JSON translations, locale switching, plurals, and Arabic RTL support.

## Run the app

You’ll need Flutter and an Android device or emulator. Both projects include an Android runner.

Clone the repository and open the starter.

```sh
git clone REPOSITORY-URL
cd flutter-easy-localization-localazy/flutter-demo
flutter pub get
flutter run
```

To run the completed app instead, use the `flutter-localazy-demo` directory. Its translations are included, so no Localazy credentials are needed.

## Working with translations

The completed app stores its translations in `assets/translations/`. To sync with your own Localazy project, create a `localazy.keys.json` file beside `localazy.json` using your project's read and write keys. Keep that file out of version control.

## Checks

Run these commands from either app directory.

```sh
flutter analyze
flutter test
```

Check the translated app on a device for text overflow and RTL layout.
