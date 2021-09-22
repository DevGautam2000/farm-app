import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/models/user_profile.dart';
import 'package:chakras_farm/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerNav extends StatefulWidget {
  final Farm farm;

  const DrawerNav({Key? key, required this.farm}) : super(key: key);

  @override
  _DrawerNavState createState() => _DrawerNavState();
}

class _DrawerNavState extends State<DrawerNav> {
  @override
  Widget build(BuildContext context) {
    var user = UserProfile("", "Pranay Kumar", "ceo@chakrasfarm.com");
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: null,
              ),
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, color: widget.farm.color),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => Login())),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("Farms"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
