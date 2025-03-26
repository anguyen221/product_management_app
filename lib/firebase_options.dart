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
    apiKey: 'AIzaSyCcQnUkvM2se0s9WC-xX0ijIk76UcheJ9M',
    appId: '1:826818377237:web:74ae17c6f6fec8b249c01c',
    messagingSenderId: '826818377237',
    projectId: 'product-management-app-80aad',
    authDomain: 'product-management-app-80aad.firebaseapp.com',
    storageBucket: 'product-management-app-80aad.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATqAr6VP8NFE2pFHxa3QKPsjdW4OkEtWM',
    appId: '1:826818377237:android:d6586ed2ab11b58749c01c',
    messagingSenderId: '826818377237',
    projectId: 'product-management-app-80aad',
    storageBucket: 'product-management-app-80aad.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrmdmivtftzNZhVz5edZozf5wGyAHnh6I',
    appId: '1:826818377237:ios:1acbdc68a526125749c01c',
    messagingSenderId: '826818377237',
    projectId: 'product-management-app-80aad',
    storageBucket: 'product-management-app-80aad.firebasestorage.app',
    iosBundleId: 'com.example.productManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrmdmivtftzNZhVz5edZozf5wGyAHnh6I',
    appId: '1:826818377237:ios:1acbdc68a526125749c01c',
    messagingSenderId: '826818377237',
    projectId: 'product-management-app-80aad',
    storageBucket: 'product-management-app-80aad.firebasestorage.app',
    iosBundleId: 'com.example.productManagementApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcQnUkvM2se0s9WC-xX0ijIk76UcheJ9M',
    appId: '1:826818377237:web:80d9031a95b6447e49c01c',
    messagingSenderId: '826818377237',
    projectId: 'product-management-app-80aad',
    authDomain: 'product-management-app-80aad.firebaseapp.com',
    storageBucket: 'product-management-app-80aad.firebasestorage.app',
  );
}
