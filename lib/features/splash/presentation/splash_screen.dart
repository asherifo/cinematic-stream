import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    Future.delayed(Duration(seconds: 4), () async {
      final preferences = await SharedPreferences.getInstance();
      final bool isLogged = preferences.getBool('isLogged') ?? false;
      if (!mounted) return;
      if (isLogged) {
        Navigator.pushReplacementNamed(context, '/HomePage');
      } else {
        Navigator.pushReplacementNamed(context, '/SignAccount');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animations/NetflixLogoSwoop.json'),
    );
  }
}
