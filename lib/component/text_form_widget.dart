



import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.controller,
    required this.mainText,
    required this.icon
  });

  final TextEditingController? controller ;
  final String mainText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10,top: 10),
      child: TextField(
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.blueAccent,
          ),
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              prefixIcon: Icon(icon),
              hintText: mainText,
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.white, width: 32.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.white, width: 32.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.white, width: 32.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.white, width: 32.0),
                  borderRadius: BorderRadius.circular(10.0)))),
    );
  }
}