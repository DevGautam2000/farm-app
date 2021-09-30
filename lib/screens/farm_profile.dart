import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/models/user_profile.dart';
import 'package:chakras_farm/providers/farm_provider.dart';
import 'package:chakras_farm/widgets/hero_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'farm_stats.dart';
import 'package:provider/provider.dart';

class FarmProfile extends StatefulWidget {
  @override
  _FarmProfileState createState() => _FarmProfileState();
}

class _FarmProfileState extends State<FarmProfile> {
  var user = UserProfile("", "Pranay Kumar", "ceo@thechakrasfarm.com");

  List<String> fields = [
    "Owner: ",
    "Name: ",
    "Estimated Time Left: ",
    "Age: ",
    "Health: ",
  ];

  int _luminance = 0;
  int _moisture = 0;
  int _temperature = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var horizontalMargin = 20.0;

    Farm farm = context.read<FarmProvider>().farm;
    this._temperature = farm.temperature;
    this._moisture = farm.moisture;
    this._luminance = farm.luminance;

    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalMargin - 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (_) => IconButton(
                    icon: Icon(
                      Icons.sort,
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                  onPressed: () => {},
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalMargin, vertical: 10),
                  child: Text(
                    "Farm details",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                HeroContainer(
                    size: size,
                    horizontalMargin: horizontalMargin,
                    fields: fields),

                //control panel data
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: horizontalMargin, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildControlPanelData(size, Colors.yellow,
                              "Luminence", _luminance.toString(), "light-bulb"),
                          buildControlPanelData(size, Colors.lightBlueAccent,
                              "Moisture", _moisture.toString(), "water-drop"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildControlPanelData(
                              size,
                              Colors.redAccent,
                              "Temperature",
                              _temperature.toString(),
                              "thermometer"),
                          Container(
                            height: 120,
                            width: size.width * .4,
                            child: Material(
                              color: Colors.transparent,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                splashColor: Colors.white,
                                iconSize: 40,
                                icon: Icon(CupertinoIcons.forward),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => FarmStats(
                                                farm: farm,
                                              )));
                                },
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }

  Widget buildControlPanelData(size, Color color, text, data, asset) {
    return Container(
      height: 180,
      width: size.width * .4,
      child: Stack(children: [
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: size.width * .4,
              height: 130,
              decoration: BoxDecoration(
                color: color.withOpacity(.35),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    left: 8,
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width * .4,
                      height: 30,
                      color: color.withOpacity(.3),
                      child: Stack(children: [
                        Positioned(
                          right: 0,
                          child: Container(
                              width: 40,
                              height: 30,
                              color: color,
                              child: Center(
                                  child: Text(
                                data,
                                style: TextStyle(fontSize: 17),
                              ))),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: size.width * .4,
            child: Image.asset(
              "assets/images/$asset.png",
              width: 100,
              height: 100,
              scale: .95,
            ),
          ),
        )
      ]),
    );
  }
}
