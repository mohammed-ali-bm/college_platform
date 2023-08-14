import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/Note.dart';
import 'package:day34/models/strings.dart';

import 'package:day34/pages/semesters.dart';
import 'package:day34/widgets/Button.dart';

import 'package:day34/widgets/noteCard.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  late final FirebaseMessaging _messaging;
  List<dynamic> notesList = [];
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
    final String requestUrl = Strings.getNotes;

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
            notesList =
                jsonCode['data']['notes'].map((e) => Note.fromJson(e)).toList();
            // packagestList = jsonCode['items']['packages']
            //     .map((e) => Package.fromJson(e))
            //     .toList();
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
                Container(
                    padding: EdgeInsets.only(top: 20, right: 16, left: 16),
                    // height: 330,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (() {
                              Get.to(Semesters());
                            }),
                            child: Text(
                              'Notes',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: notesList.length,
                                  itemBuilder: (context, index) {
                                    return NoteCard(note: notesList[index]);
                                  }),
                            ),
                          ),
                        ])));
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
