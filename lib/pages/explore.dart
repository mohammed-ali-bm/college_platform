import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/strings.dart';

import 'package:day34/pages/semesters.dart';
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

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
    // getTokens();

    _scrollController = ScrollController();
    // getData();

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
        : Directionality(
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
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.only(top: 20, right: 16, left: 16),
                    // height: 330,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Choose your department',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextCard(
                                  text: "CSE",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Semesters(),
                                        ));
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextCard(
                                  text: "ISE",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Semesters(),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextCard(
                                  text: "AIML",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Semesters(),
                                        ));
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextCard(
                                  text: "ECE",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Semesters(),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ])),
              ],
            ));
  }
}
