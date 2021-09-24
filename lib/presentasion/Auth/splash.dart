import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final assetBackground = 'assets/images/plash.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(assetBackground, fit: BoxFit.cover),
      ),
    ));
  }
}
