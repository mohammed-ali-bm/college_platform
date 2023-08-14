
import 'package:flutter/material.dart';

import '../AppStyles.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback callback; // Notice the variable type
  final Color bg;
  Button({
    required this.title,
    required this.callback,
    this.bg = AppStyles.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(bg),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
