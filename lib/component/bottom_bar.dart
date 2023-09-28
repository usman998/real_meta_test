


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realmeta_test/screens/login_screen/login.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 15,
              color: Colors.black.withOpacity(0.1),
            )
          ]
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  Center(child:
                  IconButton(onPressed:(){
                  }, icon: Icon(Icons.chat,color: Colors.red,) )
                  ),

                  Center(
                    child: Text(
                      'Chat',
                      style: TextStyle(color:Colors.red),),
                  )
                ],),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  Center(child:
                  IconButton(onPressed:(){
                  }, icon: Icon(Icons.person) )
                  ),

                  Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(color:Colors.black),),
                  )
                ],),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  Center(child:
                  IconButton(onPressed:(){
                    GetStorage().remove("userInfo");
                    Get.offAll(MyHomePage());
                  }, icon: Icon(Icons.logout) )
                  ),

                  Center(
                    child: Text(
                      'LogOut',
                      style: TextStyle(color:Colors.black),),
                  )
                ],),
            ),
          ),
        ],
      ),
    );
  }
}