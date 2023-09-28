


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realmeta_test/component/bottom_text_cont.dart';
import 'package:realmeta_test/component/rounded_btn.dart';
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
                    padding: const EdgeInsets.only(right: 30,top: 20),
                    child: RoundedButton(
                      onTap: (){
                        productController.addNote();
                      },text: "SignUp",
                    ),
                  ),

                ],
              ),
            ),
            BottomTextCont(
              onTap: (){
                Get.to(MyHomePage());
              },
              firstText: "Already have an account  ", secondText: 'Sign In',
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

