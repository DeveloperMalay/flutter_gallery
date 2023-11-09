import 'package:flutter/material.dart';

class ParallaxImage extends StatelessWidget {
  const ParallaxImage({
    Key? key,
    required this.left,
    required this.top,
    required this.asset,
    required this.height,
    required this.width,
    required this.widget,
  }) : super(key: key);

  final double left;
  final double top;
  final String asset;
  final double height;
  final double width;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: left,
        top: top,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(asset)),
              borderRadius: BorderRadius.circular(12.0)),
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[widget],
          ),
        ));
  }
}
