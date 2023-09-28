




import 'package:flutter/material.dart';



class BottomTextCont extends StatelessWidget {
  const BottomTextCont({
    super.key,
    required this.onTap,
    required this.firstText,
    required this.secondText
  });


  final Function() onTap;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: const TextStyle(
              fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black45
          ),
          children:  <TextSpan>[
            TextSpan(text: secondText, style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,color: Color(0xffffbf00))),
          ],
        ),
      ),
    );
  }
}
