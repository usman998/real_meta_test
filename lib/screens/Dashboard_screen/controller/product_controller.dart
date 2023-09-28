

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:realmeta_test/model/response_model.dart';
import 'package:realmeta_test/services.dart';


class ProductController extends GetxController {

  final HttpRequestClient _httpRequestClient = HttpRequestClient();


  RxList productList = [].obs;
  RxBool isLoaded = false.obs;




  getAllResult()async {
    var result  = await globalSearchService();
    if(result is List){
      productList.value = result;
      isLoaded.value = true;
    }
  }


  void onInit() {
    getAllResult();
    super.onInit();
  }



  Future<dynamic> globalSearchService() async {

    List<dynamic> tempList = [];

    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
      url: "https://fakestoreapi.com/products",
    );
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      log("this is resposne====> ${responseModel.data}");
      if(responseModel.data is List){
        for(var item in responseModel.data){
          tempList.add(item);
        }
      }

      return tempList;
    }else{
      return responseModel.statusDescription;
    }
  }


}