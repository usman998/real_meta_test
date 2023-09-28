



import 'package:get/get.dart';
import 'package:realmeta_test/model/product_model.dart';
import 'package:realmeta_test/model/response_model.dart';
import 'package:realmeta_test/services.dart';


class ProductController extends GetxController {

  final HttpRequestClient _httpRequestClient = HttpRequestClient();


  RxList<Product> productList = <Product>[].obs;
  RxBool isLoaded = false.obs;




  getAllResult()async {
    var result  = await globalSearchService();
    if(result is List<Product>){
      productList.value = result;
      isLoaded.value = true;
    }
  }


  void onInit() {
    getAllResult();
    super.onInit();
  }



  Future<dynamic> globalSearchService() async {

    List<Product> tempList = [];

    ResponseModel responseModel = await _httpRequestClient.getRequestWithOutHeader(
      url: "https://fakestoreapi.com/products",
    );
    if(responseModel.statusCode>=200 && responseModel.statusCode<=230){
      if(responseModel.data is List){
        for(var item in responseModel.data){
          tempList.add(Product.fromJson(json: item));
        }
      }

      return tempList;
    }else{
      return responseModel.statusDescription;
    }
  }


}