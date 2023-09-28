import 'package:flutter/material.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/component/text_header.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/screens/Dashboard_screen/product_dashboad.dart';
import 'package:realmeta_test/screens/register_screen/register.dart';





class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: double.infinity,height: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextHeader(
                    mainText: "Login",textSize: 25,
                  ),
                  TextHeader(
                    mainText: "Please Sign in to Continue",textSize: 15,textColo: Colors.black38,
                  ),
                  TextFormWidget(
                    mainText: "Email",
                    icon: Icons.email,
                    controller: TextEditingController(),
                  ),
                  TextFormWidget(
                    mainText: "Password",
                    icon: Icons.password,
                    controller: TextEditingController(),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20,top: 20),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(ProductList());
                      },
                      child: Container(
                        width: 120,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Color(0xffffbf00)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(Icons.arrow_forward,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),

                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(RegisterScreen());
              },
              child: TextHeader(
                mainText: "Don't have an account Sign in",textSize: 15,
                alignment: Alignment.center,bottomPad: 50,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}