import 'package:flutter/material.dart';
import 'dart:async';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9F4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/th.jpeg'),
            SizedBox(height: 20),
            const Text(
              'Geeti',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
