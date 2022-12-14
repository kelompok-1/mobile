// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skoolen/auth/main_page.dart';
import 'package:skoolen/pages/home_page.dart';
import 'package:skoolen/pages/login.dart';
import 'package:skoolen/pages/onboarding.dart';
import 'package:skoolen/pages/splash_screen.dart';
import 'package:skoolen/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skoolen',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
