// ignore_for_file: prefer_const_constructors

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
        body: Container(
          color: Color(0xff757575),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Text(
                    "logo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Put your code here",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0099,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: TextFormField(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Container(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0099,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Text(
                    "24",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0099,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      "Your points",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),

                Container(
                    color: Colors.red,
                    width: 150,
                    height: 40,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Export",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0099,
                ),

                Column(
                  children: [
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      "Exchange",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),

                // TextButton(
                //     onPressed: () async {
                //       await Provider.of<CodeProvider>(context, listen: false)
                //           .checkAndUpdateCode("sboij");
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Testing()));
                //     },
                //     child: Icon(Icons.code)),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
