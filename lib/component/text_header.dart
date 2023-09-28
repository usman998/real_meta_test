



import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.mainText,
    this.textSize = 17,
    this.leftPad = 20,
    this.rightPad = 20,
    this.topPad = 5,
    this.bottomPad =5,
    this.fontWieigt =FontWeight.bold,
    this.textColo = Colors.black,
    this.alignment = Alignment.centerLeft
  });

  final String mainText;
  final Alignment alignment;
  final double textSize;
  final double leftPad;
  final double rightPad;
  final double topPad;
  final double bottomPad;
  final FontWeight fontWieigt;
  final Color textColo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: leftPad,right: rightPad,top:topPad,bottom: bottomPad),
      alignment: alignment,
      child: Text(
        mainText,
        style: TextStyle(
          color: textColo,
          fontSize: textSize,
          fontWeight: fontWieigt,
        ),
      ),
    );
  }
}