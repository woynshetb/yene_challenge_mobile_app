import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yene_test_mobile/providers/code_provider.dart';

class QRGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Generating qr code for sharing points")),
      body: Center(
        child: QrImage(
            size: 200,
            data: Provider.of<CodeProvider>(context, listen: false)
                .user[0]
                .userPoint
                .toString()),
      ),
    );
  }
}
