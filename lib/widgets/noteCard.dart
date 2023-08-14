import 'dart:developer';

import 'package:day34/animation/FadeAnimation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/Note.dart';
import '../models/strings.dart';


class NoteCard extends StatelessWidget {
  // final NotificationModel noti;
  final Note note;
  NoteCard({required this.note});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      // Add This Line in Code.
      behavior: HitTestBehavior.opaque,

      onTap: (() async {
        // open in webview

        print(Strings.filesUrl + note.file!);
    
        Uri url = Uri.parse(Strings.filesUrl + note.file!);
        if (await canLaunchUrl(url))
          await launchUrl(url, mode: LaunchMode.externalApplication);
        else {
          print("error " + Strings.filesUrl + note.file!);

          // can't launch url, there is some error
          throw "Could not launch $url";
        }
      }),
      child: Card(
        // aspectRatio: 1 / 1,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        color: Colors.transparent,

        elevation: 0,
        child: FadeAnimation(
            1.5,
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 15,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/docs.png",
                            height: 40, width: 40),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                note.title!,
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 52, 142, 1),
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.cube,
                                    color: Colors.black87,
                                    size: 13,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    note.subject!.name ?? "",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
