import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Farm {
  final String name;
  final String logo;
  final Color color;

  Farm(this.name, this.logo, this.color);

  late int _luminance = 20;
  late int _moisture = 30;
  late int _temperature = 40;

  int get luminance => _luminance;

  set luminance(int value) {
    _luminance = value;
  }

  int get moisture => _moisture;

  set moisture(int value) {
    _moisture = value;
  }

  int get temperature => _temperature;

  set temperature(int value) {
    _temperature = value;
  }
}

const preFilePath = "assets/svgs";

List<Farm> farms = [
  Farm("Tomato farm", "$preFilePath/tomato.svg", Colors.red),
  Farm("Watermelon farm", "$preFilePath/tomato.svg", Colors.green),
  Farm("Eggplant farm", "$preFilePath/tomato.svg", Colors.purple),
  Farm("Orange farm", "$preFilePath/tomato.svg", Colors.orange),
];
