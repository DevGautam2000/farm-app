import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Farm {
  final String name;
  final String logo;
  final Color color;

  Farm(this.name, this.logo, this.color);
}

const preFilePath = "assets/svgs";

List<Farm> farms = [
  Farm("Tomato farm", "$preFilePath/strawberry.svg", Colors.red),
  Farm("Watermelon farm", "$preFilePath/tomato.svg", Colors.green),
  Farm("Eggplant farm", "$preFilePath/strawberry.svg", Colors.purple),
  Farm("Orange farm", "$preFilePath/tomato.svg", Colors.orange),
];
