import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/code.dart';
import 'package:http/http.dart' as http;

class CodeProvider with ChangeNotifier {
  List<Code> codeInfo = [];

  Future checkAndUpdateCode(String code) async {
    var url = Uri.parse("https://yeneproject.herokuapp.com/update");
    var response = await http.put(url, body: {"code": code});

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
      print(response.body);

      var decode = jsonDecode(response.body);
      codeInfo.add(Code(decode['code'], decode['points']));
    } else {
      print(response.statusCode);
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
