import 'package:chakras_farm/screens/farms.dart';
import 'package:chakras_farm/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorFont = Color(0xff0fa956);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/splash_icon.svg",
                    fit: BoxFit.contain,
                  )
                ],
              ),
              Container(
                width: size.width * .6,
                child: Text(
                  "Manage Your Farm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorFont,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        settings: RouteSettings(), builder: (_) => Farms())),
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
                  minimumSize: MaterialStateProperty.all(
                      Size(size.width * .75, size.height * .065)),
                  elevation: MaterialStateProperty.all(5.0),
                  backgroundColor: MaterialStateProperty.all(colorFont),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
