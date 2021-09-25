import 'dart:ffi';

import 'package:chakras_farm/helper/main_bottom_navigator.dart';
import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Farms extends StatefulWidget {
  const Farms({Key? key}) : super(key: key);

  @override
  _FarmsState createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Farms",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: farms.length,
                itemBuilder: (context, index) {
                  var farm = farms[index];
                  return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 25.0,
                                color: Colors.grey.shade400,
                                offset: Offset(2.0, 10.0))
                          ]),
                      height: size.height * .15,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => MainBottomNavigator(
                                        farm: farm,
                                      ))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  farm.name,
                                  style: TextStyle(fontSize: 18),
                                )),
                                Container(
                                  height: 100,
                                  width: 100,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: farm.color.withOpacity(.35),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.0,
                                            color: Colors.grey.shade300,
                                            offset: Offset(2.0, 6.0))
                                      ]),
                                  child: SvgPicture.asset(
                                    farm.logo,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                }),
          ),
        ),
      ),
    );
  }
}
