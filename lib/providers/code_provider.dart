import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/code.dart';
import 'package:http/http.dart' as http;

class CodeProvider with ChangeNotifier {
  List<Code> codeInfo = [Code("", 0)];
  List<User> user = [User(0)];

  incrementpoint(point) {
    print(point);
    user[0].userPoint += point;
  }

  List<Color> colors = [
    Color(0xff757575),
    Color(0xfff1212),
    Colors.red,
    Colors.brown
  ];

  List<ImageLinks> assets = [
    ImageLinks(
        "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg"),
    ImageLinks(
        "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_1280.jpg"),
  ];

  Code? info;

  Future checkAndUpdateCode(String code) async {
    var url = Uri.parse("https://yeneproject.herokuapp.com/checkcode");
    var response = await http.post(url, body: {"code": code});

    if (response.statusCode == 200) {
      await getUpdatedFile(code);
    } else {
      print(response.statusCode);
    }
  }

  Future getUpdatedFile(String code) async {
    var url = Uri.parse("https://yeneproject.herokuapp.com/getcodepoint/$code");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      debugPrint(response.body);

      var decode = jsonDecode(response.body);
      codeInfo.insert(0, Code(decode['code'], decode['points']));
      //codeInfo.add(Code(decode['code'], decode['points']));
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  Future generateCodeAndTransferCode(int points) async {
    var url =
        Uri.parse("https://yeneproject.herokuapp.com/generatecodefromUser");
    var response = await http.post(url, body: {"points": "$points"});
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
