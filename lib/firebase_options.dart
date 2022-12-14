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
    apiKey: 'AIzaSyCLtO1kMYpGll-sMv5mMtSTqhKLFyjY8Xk',
    appId: '1:538836780327:web:82d11f989fafdd10fc9502',
    messagingSenderId: '538836780327',
    projectId: 'flutterparcial4',
    authDomain: 'flutterparcial4.firebaseapp.com',
    databaseURL: 'https://flutterparcial4-default-rtdb.firebaseio.com',
    storageBucket: 'flutterparcial4.appspot.com',
    measurementId: 'G-8KCD14KX1Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEenwuBuzCZ_4apzvsb_-UlNkWXGzMHao',
    appId: '1:538836780327:android:2fd53ab304114883fc9502',
    messagingSenderId: '538836780327',
    projectId: 'flutterparcial4',
    databaseURL: 'https://flutterparcial4-default-rtdb.firebaseio.com',
    storageBucket: 'flutterparcial4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHnDBdOSMK8zRnbYpbR5ToKEkMGVY-Fuw',
    appId: '1:538836780327:ios:4fa68823e5d0cacdfc9502',
    messagingSenderId: '538836780327',
    projectId: 'flutterparcial4',
    databaseURL: 'https://flutterparcial4-default-rtdb.firebaseio.com',
    storageBucket: 'flutterparcial4.appspot.com',
    iosClientId: '538836780327-jo0v4crf4jpnspcau89rsattr6rhlkiu.apps.googleusercontent.com',
    iosBundleId: 'com.example.parcial4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHnDBdOSMK8zRnbYpbR5ToKEkMGVY-Fuw',
    appId: '1:538836780327:ios:4fa68823e5d0cacdfc9502',
    messagingSenderId: '538836780327',
    projectId: 'flutterparcial4',
    databaseURL: 'https://flutterparcial4-default-rtdb.firebaseio.com',
    storageBucket: 'flutterparcial4.appspot.com',
    iosClientId: '538836780327-jo0v4crf4jpnspcau89rsattr6rhlkiu.apps.googleusercontent.com',
    iosBundleId: 'com.example.parcial4',
  );
}
