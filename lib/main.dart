
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:expo/Screen/homee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'MALABAR',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),

      home:AnimatedSplashScreen(splash: Icons.home,
      duration: 3000,
       splashTransition: SplashTransition.rotationTransition,
       backgroundColor: Colors.blue,
      nextScreen: homee()),
    );
  }
}
