import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yene_test_mobile/providers/code_provider.dart';
import 'package:yene_test_mobile/screens/testing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await Provider.of<CodeProvider>(context, listen: false)
                      .checkAndUpdateCode("sboij");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Testing()));
                },
                child: Icon(Icons.code)),
            // Center(
            //     child: Text(Provider.of<CodeProvider>(context)
            //         .codeInfo[0]
            //         .points
            //         .toString()))
          ],
        ),
      )),
    );
  }
}
