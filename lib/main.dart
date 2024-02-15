import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/modules/screens/Loginscreen/views/loginscreen.dart';
import 'package:chat_app/modules/screens/homescreen/views/homescreen.dart';
import 'package:chat_app/modules/screens/splashscreen/views/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const Splash_screen()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(
          name: '/home',
          page: () => const Home(),
        ),
      ],
    ),
  );
}
