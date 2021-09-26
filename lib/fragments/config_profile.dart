import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfigProfile extends StatefulWidget {
  final Farm farm;

  const ConfigProfile({Key? key, required this.farm}) : super(key: key);

  @override
  _ConfigProfileState createState() => _ConfigProfileState();
}

class _ConfigProfileState extends State<ConfigProfile> {
  int _luminance = 75;
  int _moisture = 26;
  int _temperature = 13;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var horizontalMargin = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(
            left: horizontalMargin, right: horizontalMargin, top: 10),
        padding: EdgeInsets.only(top: horizontalMargin),
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ListView(
          children: [
            buildContainer(horizontalMargin, size, "Luminance", _luminance),
            buildContainer(horizontalMargin, size, "Moisture", _moisture),
            buildContainer(horizontalMargin, size, "Temperature", _temperature),
          ],
        ),
      )),
    );
  }

  Container buildContainer(
      double horizontalMargin, Size size, text, passedSliderValue) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 5)
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(horizontalMargin),
        height: size.height * .26,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(horizontalMargin - 10),
                height: size.height * .180,
                decoration: BoxDecoration(
                    color: Color(0xffC2D7C1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Set Automatically :",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Material(
                              color: Colors.transparent,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                  onPressed: () {
                                    setStateOfSliderVariable(text, 30);
                                  },
                                  padding: EdgeInsets.zero,
                                  iconSize: 30,
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 5,
                                          left: 5,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons
                                              .check_mark_circled_solid,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Material(
                              color: Colors.transparent,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              child: IconButton(
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      setStateOfSliderVariable(text, 0);
                                    });
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close_sharp,
                                      color: Colors.red,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          passedSliderValue.toStringAsFixed(0),
                          style: TextStyle(fontSize: 20),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Color(0xffD3E1CD),
                            inactiveTrackColor: Color(0xffD3E1CD),
                            thumbColor: Colors.grey,
                          ),
                          child: Slider(
                            value: passedSliderValue.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: null,
                            onChanged: (double value) {
                              setStateOfSliderVariable(text, value.toInt());
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setStateOfSliderVariable(text, val) {
    switch (text.toString().toLowerCase()) {
      case "luminance":
        setState(() {
          this._luminance = val;
        });
        break;
      case "temperature":
        setState(() {
          this._temperature = val;
        });
        break;
      case "moisture":
        setState(() {
          this._moisture = val;
        });
        break;
    }
  }
}
