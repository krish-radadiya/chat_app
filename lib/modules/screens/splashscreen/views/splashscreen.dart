import 'dart:async';
import 'package:flutter/material.dart';

class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(
          seconds: 5,
        ), () {
      Navigator.pushNamed(
        context,
        'intro',
      );
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'lib/assets/Illustration.png',
                  ),
                ),
              ),
            ),
          ),
          const Text(
            "Chat app",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
