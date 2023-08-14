import 'package:flutter/material.dart';

class LoadingDialog {
  void show(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Image.asset(
            "assets/images/loading.gif",
            height: 124,
            width: 124,
          ),
        );
      },
    );
  }

                                                                                                                 
}     

