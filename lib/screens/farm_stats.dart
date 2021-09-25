import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FarmStats extends StatefulWidget {
  final Farm farm;

  const FarmStats({Key? key, required this.farm}) : super(key: key);

  @override
  _FarmStatsState createState() => _FarmStatsState();
}

class _FarmStatsState extends State<FarmStats> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var horizontalMargin = 20.0;
    var radiusOfContainer = 34.0;
    var height = size.height * .4;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * .3,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: widget.farm.color.withOpacity(.3),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalMargin),
                        child: Container(
                          width: size.width,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: size.height * .07,
                                  child: Material(
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.hardEdge,
                                    color: Colors.transparent,
                                    child: IconButton(
                                      splashColor: Colors.white,
                                      iconSize: 30,
                                      icon: Icon(CupertinoIcons.back),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  )),
                              Positioned(
                                top: 50,
                                child: Container(
                                  width: size.width,
                                  child: Container(
                                      child: SvgPicture.asset(
                                    widget.farm.logo,
                                    height: 150,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * .25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radiusOfContainer),
                            topRight: Radius.circular(radiusOfContainer)),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalMargin,
                            ),
                            width: size.width,
                            height: size.height,
                            decoration: BoxDecoration(color: Colors.white),
                            child: ListView(children: [
                              buildPadding(),
                            ])),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tomato",
              style: TextStyle(
                fontSize: 20,
                color: widget.farm.color,
              )),
          Text("Pranay Kumar",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
