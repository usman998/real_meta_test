
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/db/user_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:realmeta_test/model/user_model.dart';
import 'package:realmeta_test/screens/Dashboard_screen/product_dashboad.dart';



class LoginController extends GetxController{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final box = GetStorage();
  RxBool isUser = false.obs;

  saveDatatoStorage(Note note) {
    box.write("userInfo", jsonEncode(note));
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }



  Future login()async{
    if(emailController.text.isEmpty||passwordController.text.isEmpty){
      Get.snackbar(
          "Invalid Details", "Please add all the details",
          snackPosition:SnackPosition.BOTTOM
      );
    } else{
      var result = await NotesDatabase.instance.readNoteByEmail(emailController.text);
      if(result is Note){
        if(result.password==passwordController.text){
          saveDatatoStorage(result);
          emailController.clear();
          passwordController.clear();
          Get.offAll(ProductList());
        } else{
          passwordController.clear();
          Get.snackbar(
              "Password Invalid", "Please Re-enter your Password",
              snackPosition:SnackPosition.BOTTOM
          );
        }
      } else{
        emailController.clear();
        passwordController.clear();
        Get.snackbar("Email Invalid", "Please Re-enter your Email and Password",snackPosition:SnackPosition.BOTTOM );
      }
    }
  }




}