import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/modules/screens/chat-app/view/chat-app.dart';
import 'package:chat_app/modules/screens/home-screen/view/home-screen.dart';
import 'package:chat_app/modules/screens/login-screen/view/login-screen.dart';
import 'package:chat_app/modules/screens/sign-up-screen/views/sign-up-screen.dart';
import 'package:chat_app/modules/screens/splashscreen/views/splashscreen.dart';
import 'package:chat_app/modules/screens/user-shows/view/user-show.dart';
import 'package:chat_app/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: primaryColor,
          textTheme: GoogleFonts.openSansTextTheme()),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
          primaryColor: Colors.white, scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const Splash_screen(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/userShow',
          page: () => const UserShow(),
        ),
        GetPage(
          name: '/chat',
          page: () => const ChatScreen(),
        ),
      ],
    ),
  );
}
