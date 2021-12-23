import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yene_test_mobile/providers/code_provider.dart';
import 'package:yene_test_mobile/screens/home.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            onPressed: () async {
              await Provider.of<CodeProvider>(context, listen: false)
                  .generateCodeAndTransferCode(1221);
            },
            icon: Icon(Icons.home)),
      ),
      body: Center(
          child: Text(Provider.of<CodeProvider>(context)
              .codeInfo[0]
              .points
              .toString())),
    );
  }
}
