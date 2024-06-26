// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgy-bdrgp6LX1X8t7Ahklp8_2xveKGrVU',
    appId: '1:974868001200:web:878df7f82ed1ddd9a56675',
    messagingSenderId: '974868001200',
    projectId: 'snack-game-4a623',
    authDomain: 'snack-game-4a623.firebaseapp.com',
    storageBucket: 'snack-game-4a623.appspot.com',
    measurementId: 'G-EL2EMG16S4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDjzGK9AQJdGb3Wjh6OgR6e2xHe3lqTJ0',
    appId: '1:974868001200:android:441fc0fd91ad0784a56675',
    messagingSenderId: '974868001200',
    projectId: 'snack-game-4a623',
    storageBucket: 'snack-game-4a623.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuznCZ87C97uoKputLueoXpD-C1uzFvr8',
    appId: '1:974868001200:ios:f94aa02fef40546ba56675',
    messagingSenderId: '974868001200',
    projectId: 'snack-game-4a623',
    storageBucket: 'snack-game-4a623.appspot.com',
    iosBundleId: 'com.example.snakeGame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuznCZ87C97uoKputLueoXpD-C1uzFvr8',
    appId: '1:974868001200:ios:1c2e62e054c802b1a56675',
    messagingSenderId: '974868001200',
    projectId: 'snack-game-4a623',
    storageBucket: 'snack-game-4a623.appspot.com',
    iosBundleId: 'com.example.snakeGame.RunnerTests',
  );
}
