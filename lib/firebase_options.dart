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
    apiKey: 'AIzaSyAAXtYqlQkDU09OmzMit73apMzQjoCyvZw',
    appId: '1:525604882466:web:0e25d05dec98b0c674627b',
    messagingSenderId: '525604882466',
    projectId: 'crypto-coins-app-c84ad',
    authDomain: 'crypto-coins-app-c84ad.firebaseapp.com',
    storageBucket: 'crypto-coins-app-c84ad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBdaIHBzvzKZuqscqxFncnMxD5wFiwQLU',
    appId: '1:525604882466:android:bc77f26f272979dc74627b',
    messagingSenderId: '525604882466',
    projectId: 'crypto-coins-app-c84ad',
    storageBucket: 'crypto-coins-app-c84ad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7RCOogXShuh4wcC88Ikbm0KZrxNNAkbg',
    appId: '1:525604882466:ios:faf56f66ea9f92dd74627b',
    messagingSenderId: '525604882466',
    projectId: 'crypto-coins-app-c84ad',
    storageBucket: 'crypto-coins-app-c84ad.appspot.com',
    iosBundleId: 'com.example.cryptocoinsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7RCOogXShuh4wcC88Ikbm0KZrxNNAkbg',
    appId: '1:525604882466:ios:faf56f66ea9f92dd74627b',
    messagingSenderId: '525604882466',
    projectId: 'crypto-coins-app-c84ad',
    storageBucket: 'crypto-coins-app-c84ad.appspot.com',
    iosBundleId: 'com.example.cryptocoinsApp',
  );
}
