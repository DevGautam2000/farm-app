import 'package:chakras_farm/helper/main_bottom_navigator.dart';
import 'package:chakras_farm/providers/farm_provider.dart';
import 'package:chakras_farm/screens/farms.dart';
import 'package:chakras_farm/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FarmProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(0xff1B5730),
          fontFamily: "Poppins"),

      //routing
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/farms': (context) => Farms(),
        '/bottomnavigator': (context) => MainBottomNavigator(),
      },
    );
  }
}
