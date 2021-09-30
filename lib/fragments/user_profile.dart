import 'package:chakras_farm/models/farm_data.dart';
import 'package:chakras_farm/models/user_profile.dart';
import 'package:chakras_farm/providers/farm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Farm farm = context.read<FarmProvider>().farm;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundColor: Colors.white,
                    backgroundColor: farm.color,
                    child: user.image.isNotEmpty
                        ? Image(image: NetworkImage(""))
                        : Text(
                            user.name.substring(0, 1).toUpperCase(),
                            style: TextStyle(fontSize: 40),
                          ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(color: farm.color, fontSize: 20),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
