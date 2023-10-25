import 'package:flutter/material.dart';

class ParallaxText extends StatelessWidget {
  const ParallaxText({
    Key? key,
    required this.left,
    required this.top,
    required this.text,
    required this.colour,
  }) : super(key: key);

  final double left;
  final double top;
  final String text;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Text(text,
          style: TextStyle(
            color: colour,
            fontWeight: FontWeight.w900,
            fontSize: 60.0,
            fontFamily: "Helvetica",
          )),
    );
  }
}
