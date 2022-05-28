import 'package:nrn_shivastuti/homepage.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/1.jpg',
      ),
      logoSize: 100,
      title: Text(
        "Shiva Stuti",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      loaderColor: Colors.white,
      showLoader: true,
      loadingText: Text("Loading...", style: TextStyle(color: Colors.white)),
      navigator: Homepage(),
      durationInSeconds: 3,
    );
  }
}
