import 'package:flutter/material.dart';
import 'package:datafolks_demo/models/option.dart';

class Options {
  Options({@required this.amount, @required this.name})
      {
    List.generate(amount, (index) => optionsList.add(Option(index, name)));
  }

  int amount;
  List<Color> colors;
  String name;
  List<Option> optionsList =[];

  factory Options.fromJson(Map<String, dynamic> json) =>
      Options(amount: json["optionsAmount"], name: json["optionName"]);

  void changeActiveOption(int i) {
    resetOptions();
    optionsList[i].changeStatus(true);
  }

  void resetOptions() {
    optionsList.forEach((element) => element.changeStatus(false));
  }
}
