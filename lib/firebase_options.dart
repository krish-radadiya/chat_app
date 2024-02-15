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
    apiKey: 'AIzaSyDhwt2vlXY9WbFGnWDUgFd9I0fAql3ks7o',
    appId: '1:657761193350:web:e50c648e7ccb97cfaaf007',
    messagingSenderId: '657761193350',
    projectId: 'chat-app-e9a68',
    authDomain: 'chat-app-e9a68.firebaseapp.com',
    storageBucket: 'chat-app-e9a68.appspot.com',
    measurementId: 'G-1X4RSGBQ60',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBylSsM7Cd5UQUPA_3CDUZHNJrPaIneLk8',
    appId: '1:657761193350:android:9f1c094d1427c2f6aaf007',
    messagingSenderId: '657761193350',
    projectId: 'chat-app-e9a68',
    storageBucket: 'chat-app-e9a68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIyCpZr8r2vGC8vqqXyeTFvcqFPHfQ97c',
    appId: '1:657761193350:ios:a0b71ce00d1c3e1faaf007',
    messagingSenderId: '657761193350',
    projectId: 'chat-app-e9a68',
    storageBucket: 'chat-app-e9a68.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIyCpZr8r2vGC8vqqXyeTFvcqFPHfQ97c',
    appId: '1:657761193350:ios:2b4fb2151bafdf67aaf007',
    messagingSenderId: '657761193350',
    projectId: 'chat-app-e9a68',
    storageBucket: 'chat-app-e9a68.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}