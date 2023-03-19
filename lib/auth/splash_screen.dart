import 'dart:async';
import 'package:alumini_final/auth/authenthication.dart';
import 'package:alumini_final/auth/otp_number.dart';
import 'package:alumini_final/auth/signin.dart';
import 'package:alumini_final/colors.dart';
import 'package:alumini_final/pages/home.dart';
import 'package:alumini_final/pages/profile/profilepage.dart';
import 'package:alumini_final/pages/searchpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/update_screens/update_profile.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    StartTimer();
  }

  // ignore: non_constant_identifier_names
  StartTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => Authentication())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
        child: Image(
          image: AssetImage('assets/Alumini_logo.png'),
        ),
      ),
    );
  }
}
