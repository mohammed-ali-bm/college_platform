import 'dart:convert';
import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/Question.dart';
import 'package:day34/models/strings.dart';

import 'package:day34/widgets/Button.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Questions extends StatefulWidget {
  final int id;
  const Questions({Key? key, required this.id}) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  late final FirebaseMessaging _messaging;
  List<dynamic> questionsList = [];
  List<dynamic> packagestList = [];
  bool dataLoaded = false;
  int rand = 0;
  String token = "";
  bool showAnswer = false;
  Future<void> getData() async {
    final String requestUrl = Strings.getQuestions + "?id=${widget.id}";

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
            questionsList = jsonCode['data']['questions']
                .map((e) => Question.fromJson(e))
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
        : Scaffold(
            body: Directionality(
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
                    SingleChildScrollView(
                  child: Column(
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
                                // Directionality(
                                //   textDirection: TextDirection.rtl,
                                //   child: StaggeredGridView.countBuilder(
                                //       crossAxisCount: 2,
                                //       crossAxisSpacing: 8,
                                //       mainAxisSpacing: 7,
                                //       // scrollDirection: Axis.horizontal,

                                //       shrinkWrap: true,
                                //       physics: NeverScrollableScrollPhysics(),
                                //       itemCount: coursesList.length,
                                //       itemBuilder: (context, index) {
                                //         return courseCard(course: coursesList[index]);
                                //       },
                                //       staggeredTileBuilder: (int index) =>
                                //           new StaggeredTile.fit(1)),
                                // ),

                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Questions Page ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 32),
                                  child: Text(questionsList[rand].question),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      rand = Random()
                                          .nextInt(questionsList.length);
                                      showAnswer = false;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/true.png",
                                        width: 64,
                                      ),
                                      Image.asset(
                                        "assets/images/false.png",
                                        width: 64,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Button(
                                    title: "show the answer",
                                    callback: () {
                                      setState(() {
                                        showAnswer = !showAnswer;
                                      });
                                    }),

                                Visibility(
                                  visible: showAnswer,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    color: Colors.grey.shade300,
                                    child: Html(
                                        data: questionsList[rand].answer,
                                        style: {
                                          "body": Style(
                                            fontSize: FontSize(18.0),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        }),
                                  ),
                                ),
                              ])),
                    ],
                  ),
                )),
          );
  }


}
