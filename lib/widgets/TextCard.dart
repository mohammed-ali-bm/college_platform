import 'package:day34/animation/FadeAnimation.dart';


import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  TextCard({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        // aspectRatio: 1 / 1,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 0,
        color: Colors.transparent,
        child: FadeAnimation(
            1.5,
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 15,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Wrap(
                      children: [
                        Text(
                          text!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
