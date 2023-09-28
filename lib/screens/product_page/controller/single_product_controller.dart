



import 'package:get/get.dart';
import 'package:realmeta_test/model/response_model.dart';
import 'package:realmeta_test/services.dart';


class SingleProductController extends GetxController{



  final HttpRequestClient _httpRequestClient = HttpRequestClient();

  RxBool isLoaded = false.obs;
  var result;



  getAllResult(String id)async {
    isLoaded.value = false;
    result  = await globalSearchService(id);
    if(result!=null){
      isLoaded.value = true;
    }
  }


  Future<dynamic> globalSearchService(String id) async {

    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
      url: "https://fakestoreapi.com/products/$id",
    );
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      return responseModel.data;
    }else{
      return null;
    }
  }


}