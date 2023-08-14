import 'dart:io';
import 'dart:math' show cos, sqrt, asin;

import 'dart:ui';

import 'package:flutter/material.dart';

class Helper {
  Color registeryBG(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "confirmed":
        return Colors.green.shade700;
      case "rejected":
        return Colors.red;
      default:
        return Colors.grey.shade200;
    }
  }

  String registeryLabel(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return "بإنتظار الموافقة";
      case "confirmed":
        return "تمت الموافقة";
      case "rejected":
        return "مرفوض";
      default:
        return "غير محدد";
    }
  }

  Color registeryColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
      case "confirmed":
      case "rejected":
        return Colors.white;

      default:
        return Colors.black;
    }
  }
}
