import 'package:chakras_farm/models/farm_data.dart';
import 'package:flutter/cupertino.dart';

class FarmProvider with ChangeNotifier {
  late Farm _farm;

  Farm get farm => _farm;

  set farm(Farm value) {
    _farm = value;
  }
}
