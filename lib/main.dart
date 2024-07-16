import 'package:final_project_of_mobile_app/screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_project_of_mobile_app/DI/service_locator.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      title: 'Final Project of Mobile App',
      theme: ThemeData(
        splashColor: Colors.transparent,
      ),
    );
  }
}
