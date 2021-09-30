import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InkWellButton extends StatelessWidget {
  const InkWellButton({
    Key? key,
    required this.farm,
  }) : super(key: key);

  final Farm farm;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.pushNamed(context, '/bottomnavigator',
            arguments: {'farm': farm}),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
    );
  }
}
