import 'package:day34/AppStyles.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  // final Widget prefixIcon;
  // final Function onTap;
  // final Function onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;
  final TextInputType type;
  final bool isPassword;
  Input({
    this.placeholder = "",
    // required this.onChanged,
    required this.suffixIcon,
    this.autofocus = false,
    this.borderColor = Colors.black54,
    this.type = TextInputType.name,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.shadow,
      child: TextField(
          // cursorColor: ArgonColors.muted,
          // onTap: onTap,
          // onChanged: onChanged,
          autofocus: autofocus,
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          style: TextStyle(height: 1, fontSize: 12.0, color: Colors.black),
          textAlignVertical: TextAlignVertical(y: 0.6),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              suffixIcon: suffixIcon,
              // prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: 1.0,
                      style: BorderStyle.solid)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: 1.0,
                      style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: 1.0,
                      style: BorderStyle.solid)),
              hintText: placeholder)),
    );
  }
}
