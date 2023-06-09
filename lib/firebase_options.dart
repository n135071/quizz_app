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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBBAOD5Vt7sASkZQZ-q2t0imAlEmh7Qf1U',
    appId: '1:145887765241:web:50a99dfc3ac06dc2d2f828',
    messagingSenderId: '145887765241',
    projectId: 'quiz-app-15409',
    authDomain: 'quiz-app-15409.firebaseapp.com',
    storageBucket: 'quiz-app-15409.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcJ42GEpJ55nyJuKgiK700ScdhDyC1Rhc',
    appId: '1:145887765241:android:88c27ebf2c8fc4c2d2f828',
    messagingSenderId: '145887765241',
    projectId: 'quiz-app-15409',
    storageBucket: 'quiz-app-15409.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsn6kP9TukjAop31cUWDzvslYggVjpn9Y',
    appId: '1:145887765241:ios:3d08160c5532ffc2d2f828',
    messagingSenderId: '145887765241',
    projectId: 'quiz-app-15409',
    storageBucket: 'quiz-app-15409.appspot.com',
    iosClientId: '145887765241-m2umrrm740oq3l9tt42hbqdun75vrmnm.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizapp',
  );
}
