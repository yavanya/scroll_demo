import 'dart:convert';

import 'package:datafolks_demo/models/options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LocalData {
  LocalData({@required this.jsonPath});

  String jsonPath;

  Future getDataFromJson() async {
    Options options;
    String _jsonString = await rootBundle.loadString(jsonPath);
    Map<String, dynamic> _raw = jsonDecode(_jsonString);
    options = Options.fromJson(_raw);
    return options;
  }
}
