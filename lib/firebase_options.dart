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
    apiKey: 'AIzaSyDMqlu9_IpU1k4vuWtDKRRQfAvzPRXPelA',
    appId: '1:613755543111:web:17ac3ebdf7d21b1f8b9b62',
    messagingSenderId: '613755543111',
    projectId: 'fly-reservation-7fef6',
    authDomain: 'fly-reservation-7fef6.firebaseapp.com',
    storageBucket: 'fly-reservation-7fef6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv1lEngcliFx7xOtO5JhcbI4eyqNJrDWk',
    appId: '1:613755543111:android:fd8e2050af7a01d38b9b62',
    messagingSenderId: '613755543111',
    projectId: 'fly-reservation-7fef6',
    storageBucket: 'fly-reservation-7fef6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApUQNB_5Xa52Dx3XGDWwVFJtD5w66Yq3Q',
    appId: '1:613755543111:ios:c4f3f28769c4a84a8b9b62',
    messagingSenderId: '613755543111',
    projectId: 'fly-reservation-7fef6',
    storageBucket: 'fly-reservation-7fef6.appspot.com',
    iosBundleId: 'com.example.flyReservation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApUQNB_5Xa52Dx3XGDWwVFJtD5w66Yq3Q',
    appId: '1:613755543111:ios:76ac7635e6bd80248b9b62',
    messagingSenderId: '613755543111',
    projectId: 'fly-reservation-7fef6',
    storageBucket: 'fly-reservation-7fef6.appspot.com',
    iosBundleId: 'com.example.flyReservation.RunnerTests',
  );
}