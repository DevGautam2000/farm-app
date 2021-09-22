import 'package:chakras_farm/helper/drawer_nav.dart';
import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/widgets/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FarmProfile extends StatefulWidget {
  final Farm farm;

  const FarmProfile({Key? key, required this.farm}) : super(key: key);

  @override
  _FarmProfileState createState() => _FarmProfileState();
}

class _FarmProfileState extends State<FarmProfile> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: widget.farm.color,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none_outlined),
              onPressed: () => {},
            ),
          ],
          // leading: IconButton(
          //   icon: Icon(Icons.sort),
          //   onPressed: () => {},
          // ),
          elevation: 0,
        ),
        drawer: DrawerNav(farm: widget.farm),
        body: Container(
          child: SvgPicture.asset(widget.farm.logo),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    offset: Offset(0, 2)),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: BottomNavigator(_selectedIndex, widget.farm))));
  }
}
