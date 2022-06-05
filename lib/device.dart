import 'package:flutter/cupertino.dart';

class Device {
  late String name;
  late IconData icon;
  late List<bool> power;
  late String category;

  //constructor
  Device(String name, IconData icon, String category) {
    this.name = name;
    this.icon = icon;
    this.power = [false];
    this.category = category;
  }
}
