import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  int selectedIndex;
  final Farm farm;

  BottomNavigator(this.selectedIndex, this.farm);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: widget.farm.color,
        currentIndex: widget.selectedIndex,
        iconSize: 30.0,
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_accessibility), label: ""),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.share), label: ""),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: ""),
        ]);
  }
}
