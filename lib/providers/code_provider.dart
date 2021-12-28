import 'package:flutter/material.dart';
import '../models/code.dart';
import 'package:http/http.dart' as http;

class CodeProvider with ChangeNotifier {
  //List<Code> codeInfo = [Code("", 0)];
  List<User> user = [User(0)];

  incrementpoint(point) {
    user[0].userPoint += point;
  }

  Code? info;

  Future checkAndUpdateCode(String code, int point) async {
    var url = Uri.parse("https://yeneproject.herokuapp.com/checkcode");
    var response = await http.post(url, body: {"code": code});

    if (response.statusCode == 200) {
      incrementpoint(point);
    } else {
      debugPrint(response.statusCode.toString());
    }
  }

  // Future getUpdatedFile(String code) async {
  //   var url = Uri.parse("https://yeneproject.herokuapp.com/getcodepoint/$code");
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     debugPrint(response.body);

  //     var decode = jsonDecode(response.body);
  //     codeInfo.insert(0, Code(decode['code'], decode['points']));
  //   } else {
  //     debugPrint(response.statusCode.toString());
  //   }
  // }

//   Future generateCodeAndTransferCode(int points) async {
//     var url =
//         Uri.parse("https://yeneproject.herokuapp.com/generatecodefromUser");
//     var response = await http.post(url, body: {"points": "$points"});
//     if (response.statusCode == 200) {
//       debugPrint(response.body);
//     } else {
//       debugPrint(response.statusCode.toString());
//     }
//   }
}
