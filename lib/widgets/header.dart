import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showBackIcon;

  Header({
    required this.title,
    this.showBackIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackIcon)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                CupertinoIcons.chevron_forward,
                size: 30,
              ),
            ),
          Expanded(
              child: Text(
            title,
            style: TextStyle(fontSize: 20),
            textAlign: showBackIcon ? TextAlign.center : TextAlign.start,
          )),
          Row(
            children: [
              // Image.asset(
              //   "assets/icons/noti.png",
              //   width: 28,
              // ),
              // SizedBox(
              //   width: 10,
              // ),
              SvgPicture.asset(
                "assets/icons/menu.svg",
                height: 12,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
