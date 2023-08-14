import 'package:day34/animation/FadeAnimation.dart';
import 'package:day34/models/Enquiry.dart';
import 'package:day34/pages/enquiry.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class EnquiryCard extends StatelessWidget {
  // final NotificationModel noti;
  final Enquiry enquiry;
  EnquiryCard({
    required this.enquiry,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InkWell(
      // behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.to(EnquiryPage(
          enquiry: enquiry,
        ));
      },
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
                        Image.asset("assets/images/question.png",
                            height: 40, width: 40),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                enquiry.title!,
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
                                    enquiry.createdAt!,
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
