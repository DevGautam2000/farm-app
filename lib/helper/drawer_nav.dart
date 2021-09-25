import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/models/user_profile.dart';
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
    var user = UserProfile("", "Pranay Kumar", "ceo@thechakrasfarm.com");
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: user.name.isNotEmpty
                ? CircleAvatar(
                    child: Text(
                      user.name.substring(0, 1).toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: null,
                  ),
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle, color: widget.farm.color),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: widget.farm.color,
            ),
            title: Text("Home"),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.grass, color: widget.farm.color),
            title: Text("Farms"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
