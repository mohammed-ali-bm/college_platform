import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/Enquiry.dart';
import 'package:day34/models/strings.dart';

import 'package:day34/widgets/Button.dart';
import 'package:day34/widgets/EnquiryCard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EnquiriesPage extends StatefulWidget {
  const EnquiriesPage({Key? key}) : super(key: key);

  @override
  _EnquiriesPageState createState() => _EnquiriesPageState();
}

class _EnquiriesPageState extends State<EnquiriesPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  late final FirebaseMessaging _messaging;
  List<dynamic> enquriesList = [];
  List<dynamic> packagestList = [];
  bool dataLoaded = false;

  String token = "";

  getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token =
          ((prefs.getString("token") != null) ? prefs.getString("token") : "")!;
    });
  }

  Future<void> getData() async {
    final String requestUrl = Strings.getEnquiries;

    try {
      final http.Response request = await http.get(
        Uri.parse(requestUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (request.statusCode == 200) {
        final jsonCode = await json.decode(request.body);

        if (jsonCode['status']) {
          setState(() {
            enquriesList = jsonCode['data']['enquiries']
                .map((e) => Enquiry.fromJson(e))
                .toList();

            dataLoaded = true;
          });
        } else {
          showOkAlertDialog(
              context: context,
              title: "حصلت مشكلة",
              message: "حصلت مشكلة يرجى إعادة المحاولة او المحاولة بوقت لاحق");
        }
      }
    } catch (e) {
      showOkAlertDialog(
          context: context,
          title: "حصلت مشكلة ",
          message: "حصلت مشكلة يرجى إعادة المحاولة او التواصل معنا لحلها");
    }
  }

  @override
  void initState() {
    // getTokens();

    // registerNotification();
    _scrollController = ScrollController();
    getData();

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
              // mainAxisAlignment: MainAxisAlignment.center,
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
                            'Enquiries',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: enquriesList.length,
                              itemBuilder: (context, index) {
                                return EnquiryCard(
                                    enquiry: enquriesList[index]);
                              }),
                        ])),
              ],
            ));
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
