import 'package:flutter/material.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/component/text_header.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/screens/Dashboard_screen/product_dashboad.dart';
import 'package:realmeta_test/screens/login_screen/controller/login_controller.dart';
import 'package:realmeta_test/screens/register_screen/register.dart';





class MyHomePage extends StatelessWidget {



  final LoginController productController = Get.put(LoginController());


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
                    mainText: "Login",textSize: 45,
                  ),
                  TextHeader(
                    mainText: "Please Sign in to Continue",textSize: 25,textColo: Colors.black38,
                  ),
                  SizedBox(height: 30,),
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
                    padding: EdgeInsets.only(right: 30,top: 20),
                    child: GestureDetector(
                      onTap: (){
                        productController.login();
                      },
                      child: Container(
                        width: 130,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
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
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account  ",
                  style: TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'Sign Up', style: TextStyle(
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