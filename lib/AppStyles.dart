import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle stepperStyle = TextStyle(fontSize: 11);
  static const Color primaryColor = Color.fromRGBO(8, 52, 142, 1);
  static const Color primaryDark = Color.fromRGBO(8, 52, 242, 1);
  static const Color primaryColorLight = Color.fromRGBO(8, 52, 242, .5);
  static const Color secondaryColor = Color.fromRGBO(14, 133, 172, 1);
  static const Color accentColor = Color.fromRGBO(226, 201, 152, 1);
  static BoxDecoration shadow = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: Offset(5, 10),
        blurRadius: 15,
        color: Colors.grey.shade200,
      )
    ],
  );
  static BoxDecoration shadowborder = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white,
    border: Border.all(
      color: Colors.black12,
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        offset: Offset(5, 10),
        blurRadius: 15,
        color: Colors.grey.shade200,
      )
    ],
  );
}
