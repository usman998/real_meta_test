



import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  const ColoredCircle({
    Key? key,
    required this.height,
    required this.width,
    required this.boxColor,
    required this.borderColor,
  }) : super(key: key);

  final double height;
  final double width;
  final Color boxColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height*0.03 ,width: width*0.05,
      decoration: BoxDecoration(

          color: boxColor,
          shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(3),
      child: Container(
        height:height*0.03 ,width: width*0.05,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor,width: 2),
            color: boxColor,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}