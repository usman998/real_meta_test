import 'package:flutter/material.dart';
import 'package:realmeta_test/component/bottom_text_cont.dart';
import 'package:realmeta_test/component/rounded_btn.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/component/text_header.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/screens/login_screen/controller/login_controller.dart';
import 'package:realmeta_test/screens/register_screen/register.dart';





class MyHomePage extends StatelessWidget {



  final LoginController productController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextHeader(
                    mainText: "Login",textSize: 45,
                  ),
                  const TextHeader(
                    mainText: "Please Sign in to Continue",textSize: 25,textColo: Colors.black38,
                  ),
                  const SizedBox(height: 30,),
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
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 30,top: 20),
                    child: RoundedButton(
                      onTap: (){
                        productController.login();
                      },text: "Login",
                    ),
                  )
                ],
              ),
            ),
            BottomTextCont(
              onTap: (){
                Get.to(RegisterScreen());
              },
              firstText: "Don't have an account  ", secondText: 'Sign Up',
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

