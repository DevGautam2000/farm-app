import 'package:chakras_farm/fragments/config_profile.dart';
import 'package:chakras_farm/helper/drawer_nav.dart';
import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/screens/farm_profile.dart';
import 'package:chakras_farm/screens/login.dart';
import 'package:chakras_farm/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNavigator extends StatefulWidget {
  final Farm farm;

  const MainBottomNavigator({Key? key, required this.farm}) : super(key: key);

  @override
  _MainBottomNavigatorState createState() => _MainBottomNavigatorState();
}

class _MainBottomNavigatorState extends State<MainBottomNavigator> {
  int _selectedIndex = 0;

  void _onTap(index) {
    setState(() => _selectedIndex = index);
    if (index == 2)
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => Splash()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Widget getFragment(index) {
      switch (index) {
        case 1:
          return ConfigProfile(farm: widget.farm);
        case 3:
          return Scaffold();
      }

      return FarmProfile(farm: widget.farm);
    }

    return Scaffold(
      drawer: DrawerNav(farm: widget.farm),
      body: getFragment(_selectedIndex),
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
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: widget.farm.color,
                  currentIndex: _selectedIndex,
                  iconSize: 30.0,
                  onTap: _onTap,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: ""),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.logout), label: ""),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.profile_circled), label: ""),
                  ]))),
    );
  }
}
