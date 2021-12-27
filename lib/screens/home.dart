// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yene_test_mobile/providers/code_provider.dart';
import 'package:yene_test_mobile/screens/qr_code_scanner.dart';
import 'package:yene_test_mobile/screens/qr_generator.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController code = TextEditingController();
  int i = 0;
  int x = 0;
  Color? color;
  String? imageUrl;
  String? heroUrl;
  String? ctaLabel;
  int? incrementingPoint;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getinfo();
  }

  final referenceData = FirebaseDatabase.instance
      .ref("app-setting/kxQ1QnyR1ztbJG7fupS0")
      .child("bgUrl");

  var info = FirebaseFirestore.instance.collection("app-setting");

  getinfo() async {
    var info = FirebaseFirestore.instance
        .collection("app-setting")
        .doc("kxQ1QnyR1ztbJG7fupS0")
        .get()
        .then((queryDocumentSnapshot) {
      setState(() {
        imageUrl = queryDocumentSnapshot.get("bgUrl");
        heroUrl = queryDocumentSnapshot.get("heroUrl");
        ctaLabel = queryDocumentSnapshot.get("ctaLabel");
        incrementingPoint = int.parse(queryDocumentSnapshot.get("point"));
      });
    });
  }

  getdata() async {
    DatabaseEvent event = await referenceData.once();
    // got this value
    print(event.snapshot.value);
    setState(() {
      // imageUrl = event.snapshot.value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff757575),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageUrl == null
                  ? NetworkImage("url")
                  : NetworkImage("${imageUrl}"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
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
                height: 30,
              ),
              Container(
                //  padding: EdgeInsets.only(top: 162, left: 145),
                width: 154,
                height: 21,
                child: Text(
                  "Put your code here",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 199.8,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.red,
                  ),
                  onChanged: (value) async {
                    await Provider.of<CodeProvider>(context, listen: false)
                        .checkAndUpdateCode(value);

                    await Provider.of<CodeProvider>(context, listen: false)
                        .incrementpoint(incrementingPoint);
                  },
                ),
              ),
              SizedBox(height: 40),
              heroUrl == null
                  ? Image.asset(
                      "assets/hero.png",
                      height: 288,
                      width: 300,
                    )
                  : Image.network(
                      "${heroUrl}",
                      height: 288,
                      width: 300,
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(left: 70),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Text(
                        Provider.of<CodeProvider>(context, listen: false)
                            .user[0]
                            .userPoint
                            .toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/image.png",
                    width: 57,
                    height: 93,
                  ),
                  Text(
                    "Your points",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  color: Colors.red,
                  width: 197,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRGenerator()));
                      },
                      child: ctaLabel == null
                          ? Text("Export")
                          : Text(
                              ctaLabel.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21),
                            ))),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 300),
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRScanPage()));
                        },
                        child: Image.asset(
                          "assets/rec.png",
                          width: 40,
                          height: 30,
                        )),
                    Text("Exchange",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontSize: 15))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
