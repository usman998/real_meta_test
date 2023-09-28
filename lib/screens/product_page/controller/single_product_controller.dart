

import 'dart:developer';

import 'package:get/get.dart';
import 'package:realmeta_test/model/response_model.dart';
import 'package:realmeta_test/services.dart';


class SingleProductController extends GetxController{



  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  RxBool isLoaded = false.obs;
  var result;



  getAllResult(String id)async {
    result  = await globalSearchService(id);
    if(result!=null){
      isLoaded.value = true;
    }
  }


  Future<dynamic> globalSearchService(String id) async {

    List<dynamic> tempList = [];

    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
      url: "https://fakestoreapi.com/products/$id",
    );
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      log("this is resposne====> ${responseModel.data}");

      return responseModel.data;
    }else{
      return null;
    }
  }


}