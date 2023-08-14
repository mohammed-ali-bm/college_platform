import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/models/Note.dart';
import 'package:day34/models/strings.dart';

import 'package:day34/pages/questions.dart';
import 'package:day34/widgets/TextCard.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({Key? key}) : super(key: key);

  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  late final FirebaseMessaging _messaging;
  List<dynamic> subjectsList = [];
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
    final String requestUrl = Strings.getSubjects + "?id=4";

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
            subjectsList = jsonCode['data']['subjects']
                .map((e) => Subject.fromJson(e))
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
        : Scaffold(
            body: Container(
              color: Colors.white,
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child:

                      // ),
                      Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
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
                                  'Choose The subject',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: subjectsList.length,
                                  itemBuilder: (context, index) {
                                    return TextCard(
                                      text: subjectsList[index].name,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Questions(
                                                  id: subjectsList[index].id),
                                            ));
                                      },
                                    );
                                  },
                                )
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
