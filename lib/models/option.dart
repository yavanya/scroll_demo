import 'package:flutter/material.dart';

class Option {
  bool isActive = false;
  String name;
  int index;
  final List<Color> colors = [Color(0xffffffff), Color(0xff6458F6)];
  Color color;

  Option(this.index, this.name) {
    name = '$name${index+1}';
    isActive ? color = colors[1] : color = colors[0];
  }
  void changeStatus(bool b) {
    isActive = b;
    isActive ? color = colors[1] : color = colors[0];
  }
}
