import 'dart:math';

import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:jr_group/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool run = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDrawing.paths(
          [
            (Path()
              ..addOval(Rect.fromCircle(center: Offset.zero, radius: 75.0)))
                .transform(Matrix4.rotationX(-pi)
                .storage), //A circle which is slightly rotated
          ],
          paints: [
            Paint()..style = PaintingStyle.stroke,
          ],
          run: run,
          animationOrder: PathOrders.original,
          duration: Duration(seconds: 2),
          lineAnimation: LineAnimation.oneByOne,
          animationCurve: Curves.linear,
          onFinish: () => setState(() {
            run = false;
          }),
        )
      ),
    );
  }
}
