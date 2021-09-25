import 'package:chakras_farm/screens/farm_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeroContainer extends StatelessWidget {
  const HeroContainer({
    Key? key,
    required this.size,
    required this.horizontalMargin,
    required this.widget,
    required this.fields,
  }) : super(key: key);

  final Size size;
  final double horizontalMargin;
  final FarmProfile widget;
  final List<String> fields;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                spreadRadius: 2,
                color: Colors.grey.shade400,
                blurRadius: 6)
          ],
          borderRadius: BorderRadius.circular(12)),
      height: size.height * .27,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 10),
      child: Container(
        height: size.height * .27,
        width: size.width,
        decoration: BoxDecoration(
            color: widget.farm.color.withOpacity(.3),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              widget.farm.logo,
              height: 170,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: fields
                    .map((e) => Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          child: Row(
                            children: [
                              Text(
                                e,
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
