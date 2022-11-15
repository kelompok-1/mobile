import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skoolen/pages/home_page.dart';
import 'package:skoolen/pages/onboarding.dart';
import 'package:skoolen/pages/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Onboarding();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/pictures/Splash Screen.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/pictures/logo_tagline.png",
                  ),
                  scale: 2,
                ),
              ),
            ),
          ],
          // alignment: Alignment.center,
          // padding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
