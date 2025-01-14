// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDpmT99_qNqpWSUne9ZpN44w49e9VP-LEQ',
    appId: '1:722835547472:web:7a30662863317b87577855',
    messagingSenderId: '722835547472',
    projectId: 'contact-app-7d39b',
    authDomain: 'contact-app-7d39b.firebaseapp.com',
    storageBucket: 'contact-app-7d39b.firebasestorage.app',
    measurementId: 'G-WDMH5MV2E3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpzQZGoFsMJJTepM8HVHFzfQM3tnYXJO0',
    appId: '1:722835547472:android:28ca9cae6b1aad8e577855',
    messagingSenderId: '722835547472',
    projectId: 'contact-app-7d39b',
    storageBucket: 'contact-app-7d39b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCytUs1_LkRpd-E2i5PG-rzi0MKEIq1xx8',
    appId: '1:722835547472:ios:69862575cad7effa577855',
    messagingSenderId: '722835547472',
    projectId: 'contact-app-7d39b',
    storageBucket: 'contact-app-7d39b.firebasestorage.app',
    iosBundleId: 'com.example.contactApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCytUs1_LkRpd-E2i5PG-rzi0MKEIq1xx8',
    appId: '1:722835547472:ios:69862575cad7effa577855',
    messagingSenderId: '722835547472',
    projectId: 'contact-app-7d39b',
    storageBucket: 'contact-app-7d39b.firebasestorage.app',
    iosBundleId: 'com.example.contactApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpmT99_qNqpWSUne9ZpN44w49e9VP-LEQ',
    appId: '1:722835547472:web:bd8945cb2a81b0c3577855',
    messagingSenderId: '722835547472',
    projectId: 'contact-app-7d39b',
    authDomain: 'contact-app-7d39b.firebaseapp.com',
    storageBucket: 'contact-app-7d39b.firebasestorage.app',
    measurementId: 'G-S664PHH9PF',
  );
}
