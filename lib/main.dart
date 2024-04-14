import 'package:flutter/material.dart';
import 'package:plantmed/splash_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme : ThemeData(fontFamily: 'Arimo'),

      debugShowCheckedModeBanner: false,
      home: const SplashWidget(),
    );
  }
}
