import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mealapp/screens/Categories_Screen.dart';
import 'package:mealapp/screens/category_meal_screen.dart';
import '../screens/tabs_screen.dart';
class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState() {
    print("Hello");
    super.initState();
  Timer(const Duration(seconds: 3), (){
    Navigator.pushReplacementNamed(context, TabsScreen.routeName);
  });
  }
 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: Center(
        child: Image.asset('assets/images/splash.png'),
      ),
    );
  }
}
