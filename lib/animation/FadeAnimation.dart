import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child1;

  FadeAnimation(this.delay, this.child1);

  @override
  Widget build(BuildContext context) {
    final tween = Tween();
    
  //   MovieTween([
  //     Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
  //     Track("translateY").add(
  //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
  //       curve: Curves.easeOut)
  // ]);

    return Container(
      // delay: Duration(milliseconds: (500 * delay).round()),
      // duration: const Duration(milliseconds: 500),
      // tween:  Tween(begin: 100.0, end: 200.0),
      child: child1,
      // builder: (context, child, animation) => Opacity(
      //   opacity: (animation as Map)["opacity"],
      //   child: Transform.translate(
          
      //     offset: Offset(0, (animation as Map)["translateY"]), 
      //     child: child1
      //   ),
      // ),
    );
  }
}
