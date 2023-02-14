import 'package:alumini_final/auth/splash_screen.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
