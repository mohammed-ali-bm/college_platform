import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';

import 'package:day34/models/strings.dart';
import 'package:day34/pages/subjects.dart';
import 'package:day34/widgets/Button.dart';
import 'package:day34/widgets/TextCard.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Semesters extends StatefulWidget {
  const Semesters({Key? key}) : super(key: key);

  @override
  _SemestersState createState() => _SemestersState();
}

class _SemestersState extends State<Semesters> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  late final FirebaseMessaging _messaging;
  List<dynamic> coursesList = [];
  List<dynamic> packagestList = [];
  bool dataLoaded = true;

  String token = "";

  getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token =
          ((prefs.getString("token") != null) ? prefs.getString("token") : "")!;
    });
  }





  @override
  void initState() {
    getTokens();

    _scrollController = ScrollController();

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !dataLoaded
        ? Container(
            color: Colors.white,
            child: Center(
              child: Image.asset("assets/images/loading.gif"),
            ),
          )
        : Scaffold(
            body: Container(
              color: Colors.white,
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child:
                      // SliverAppBar(
                      //   expandedHeight: 0.0,
                      //   elevation: 0,
                      //   pinned: true,
                      //   floating: true,
                      //   stretch: true,
                      //   backgroundColor: Colors.grey.shade50,
                      //   flexibleSpace: FlexibleSpaceBar(
                      //       collapseMode: CollapseMode.pin,
                      //       // titlePadding: EdgeInsets.only(right: 20, left: 30, bottom: 100),
                      //       stretchModes: [
                      //         StretchMode.zoomBackground,
                      //         // StretchMode.fadeTitle
                      //       ],
                      //       background: Image.asset(
                      //         "assets/images/background.png",
                      //         fit: BoxFit.cover,
                      //       )),
                      // ),
                      Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding:
                              EdgeInsets.only(top: 20, right: 16, left: 16),
                          // height: 330,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Choose your Semester',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextCard(
                                        text: "1",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextCard(
                                        text: "2",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextCard(
                                        text: "3",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextCard(
                                        text: "4",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextCard(
                                        text: "5",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextCard(
                                        text: "6",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextCard(
                                        text: "7",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextCard(
                                        text: "8",
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubjectsPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ])),
                    ],
                  )),
            ),
          );
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
