


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/component/text_header.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/screens/login_screen/login.dart';

import 'controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterController productController = Get.put(RegisterController());

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
                    mainText: "Create Account",textSize: 40,bottomPad: 30,
                  ),
                  TextFormWidget(
                    mainText: "Name",
                    icon: Icons.person,
                    controller: productController.titleController,
                  ),
                  TextFormWidget(
                    mainText: "Email",
                    icon: Icons.email,
                    controller: productController.emailController,
                  ),
                  TextFormWidget(
                    mainText: "Password",
                    obsecure: true,
                    icon: Icons.lock,
                    controller: productController.passwordController,
                  ),
                  TextFormWidget(
                    obsecure: true,
                    mainText: "Confirm Password",
                    icon: Icons.lock,
                    controller: productController.confirmPasswordController,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20,top: 20),
                    child: GestureDetector(
                      onTap: (){
                        productController.addNote();
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Color(0xffffbf00)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            )
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "SignUp",
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
                Get.to(MyHomePage());
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account  ",
                  style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Sign In', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,color: Color(0xffffbf00))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
