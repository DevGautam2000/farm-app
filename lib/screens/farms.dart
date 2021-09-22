import 'dart:ffi';

import 'package:flutter/material.dart';

class Farms extends StatefulWidget {
  const Farms({Key? key}) : super(key: key);

  @override
  _FarmsState createState() => _FarmsState();
}

class _FarmsState extends State<Farms> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print("$index was tapped");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 25.0,
                                color: Colors.grey.shade300,
                                offset: Offset(2.0, 10.0))
                          ]),
                      height: size.height * .2,
                      child: Text("i am chold"),
                    ),
                  ),
                )),
      ),
    );
  }
}
