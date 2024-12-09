import 'package:flutter/material.dart';
import 'landing_page.dart';

/// **SplashScreen**
///
/// The initial splash screen that appears when the app launches.
/// This screen displays the app's logo and waits for a few seconds
/// before navigating to the **LandingPage**.
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    // **Delay splash screen for 3 seconds, then navigate to LandingPage**
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()), // Navigate to LandingPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF0a0a0a),
        ),
        child: Center(
          child: Image.asset(
            'assets/logo/applogo.png', // Path to the logo asset
            width: 350,
            height: 540,
          ),
        ),
      ),
    );
  }
}