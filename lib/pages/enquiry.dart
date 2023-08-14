import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/Enquiry.dart';
import 'package:day34/models/strings.dart';
import 'package:day34/widgets/Button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class EnquiryPage extends StatefulWidget {
  final Enquiry enquiry;
  const EnquiryPage({Key? key, required this.enquiry}) : super(key: key);

  @override
  _EnquiryPageState createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
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




  Future<void> getData() async {
    final String requestUrl = Strings.index;

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
        : Scaffold(
            body: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.enquiry.title!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.enquiry.content!,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Colors.green.shade400,
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "You can contact the publisher  on his mobile  : 7349167322",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }

}