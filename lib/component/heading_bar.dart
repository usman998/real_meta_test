



import 'package:flutter/material.dart';

class HeadingBar extends StatelessWidget {
  const HeadingBar({
    Key? key,
    this.leftPad =0,
    this.rightPad=0,
    this.bottomPad=0,
    required this.text,
    this.fontSize = 17,
    this.maxlines=1,
    this.fontWeight =FontWeight.w400,
    this.widgetAlign = Alignment.centerLeft,
    this.textColor=Colors.black45,
    this.topPad=0}) : super(key: key);



  final double leftPad;
  final double rightPad;
  final double bottomPad;
  final double topPad;
  final int maxlines;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment widgetAlign;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: leftPad,right: rightPad,bottom: bottomPad,top: topPad),
      alignment: widgetAlign,
      child: Text(
        text,maxLines:maxlines,overflow:TextOverflow.ellipsis,style: TextStyle(
        color: textColor,fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      ),
    );
  }
}