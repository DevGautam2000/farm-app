import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/widgets/inkwell_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            child: buildListView(size),
          ),
        ),
      ),
    );
  }

  ListView buildListView(Size size) {
    return ListView.builder(
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
              child: InkWellButton(farm: farm));
        });
  }
}
