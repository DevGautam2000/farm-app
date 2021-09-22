import 'package:chakras_farm/screens/farms.dart';
import 'package:chakras_farm/screens/home.dart';
import 'package:chakras_farm/screens/login.dart';
import 'package:chakras_farm/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var animTime = 400;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xff1B5730),
          fontFamily: "Poppins"),
      home: Splash(),
    );
  }
}
