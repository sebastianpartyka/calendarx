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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2K29B7cgdBkZcYjMNIfKuyn5sT-6jU94',
    appId: '1:867181633829:android:24850abdc77e11517e7acc',
    messagingSenderId: '867181633829',
    projectId: 'calendarx-79812',
    storageBucket: 'calendarx-79812.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu8ukO1qMqoX8qTkBqpLCP6fUhkwlBbEc',
    appId: '1:867181633829:ios:3b3ba8a3a728c34e7e7acc',
    messagingSenderId: '867181633829',
    projectId: 'calendarx-79812',
    storageBucket: 'calendarx-79812.appspot.com',
    iosClientId: '867181633829-7u7a7pau0jrrtcdgubkm6i4hcb34e4u2.apps.googleusercontent.com',
    iosBundleId: 'com.sebastianpartyka.calendarx',
  );
}




// Platform  Firebase App Id
// android   1:867181633829:android:24850abdc77e11517e7acc
// ios       1:867181633829:ios:3b3ba8a3a728c34e7e7acc