
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/db/user_database.dart';
import 'package:realmeta_test/model/response_model.dart';
import 'package:realmeta_test/model/user_model.dart';
import 'package:realmeta_test/screens/Dashboard_screen/product_dashboad.dart';
import 'package:realmeta_test/services.dart';



class RegisterController extends GetxController{


  TextEditingController titleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();




  Future addNote() async {
    if(titleController.text.isEmpty||emailController.text.isEmpty||passwordController.text.isEmpty||confirmPasswordController.text.isEmpty){
      Get.snackbar(
          "Invalid Details", "Please add all the details",
          snackPosition:SnackPosition.BOTTOM
      );
    } else if (!GetUtils.isEmail(emailController.text)){
      emailController.clear();
      Get.snackbar(
          "Invalid Email", "please write correct email",
          snackPosition:SnackPosition.BOTTOM
      );
    }else if(passwordController.text.length<8){
      passwordController.clear();
      confirmPasswordController.clear();
      Get.snackbar(
          "Invalid Password", "Password must have 8 characters",
          snackPosition:SnackPosition.BOTTOM
      );
    } else if(passwordController.text != confirmPasswordController.text){
      passwordController.clear();
      confirmPasswordController.clear();
      Get.snackbar(
          "Invalid Password", "Please Re-enter your Password",
          snackPosition:SnackPosition.BOTTOM
      );
    } else{
      final note = Note(
        title: titleController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      await NotesDatabase.instance.create(note);
      Get.offAll(ProductList());
    }

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }





}