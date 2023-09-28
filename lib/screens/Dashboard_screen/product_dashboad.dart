




import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/screens/Dashboard_screen/controller/product_controller.dart';
import 'package:realmeta_test/screens/login_screen/login.dart';
import 'package:realmeta_test/screens/product_page/product.dart';
import 'package:get_storage/get_storage.dart';

class ProductList extends StatelessWidget {
   ProductList({super.key});


  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  (Obx(()=>Scaffold(
      body: productController.isLoaded.value==false?Container(
        width: double.infinity,height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
    ):SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Conversations",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.pink.shade50
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: Colors.red,),
                        Text(
                          "Add New",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFormWidget(
              mainText: "Search",
              icon: Icons.search,
              controller: TextEditingController(),
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 80,
                    // color: Colors.blue,
                    child: GestureDetector(
                      onTap: (){
                        Get.to(ProductPage(id:productController.productList[index]["id"].toString()),);
                      },
                      child: Row(
                        children: [
                          Expanded(child:Container(
                            child:Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey.shade400,
                                  foregroundImage: NetworkImage(
                                      productController.productList[index]["image"]
                                  ),
                                  child: Icon(Icons.person,size: 40,color: Colors.white,),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Container(
                                    height: double.infinity,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 20),
                                          width: double.infinity,
                                          child: Text(
                                            productController.productList[index]["title"]??"",
                                            maxLines: 3,overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text(
                                            productController.productList[index]["category"]??"",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          )),
                          Container(
                            height: double.infinity,
                            alignment : Alignment.center,
                            child: Text(
                              "Monday",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 5,);
                },
                itemCount: productController.productList.length)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -1),
                blurRadius: 15,
                color: Colors.black.withOpacity(0.1),
              )
            ]
        ),
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                // color: Colors.white,
                child: Column(
                  children: [
                    Center(child:
                    IconButton(onPressed:(){
                    }, icon: Icon(Icons.chat) )
                    ),

                    Center(
                      child: Text(
                        'Chat',
                        style: TextStyle(color:Colors.black),),
                    )
                  ],),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.white,
                child: Column(
                  children: [
                    Center(child:
                    IconButton(onPressed:(){
                    }, icon: Icon(Icons.person) )
                    ),

                    Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(color:Colors.black),),
                    )
                  ],),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.white,
                child: Column(
                  children: [
                    Center(child:
                    IconButton(onPressed:(){
                      GetStorage().remove("userInfo");
                      Get.offAll(MyHomePage());
                    }, icon: Icon(Icons.logout) )
                    ),

                    Center(
                      child: Text(
                        'LogOut',
                        style: TextStyle(color:Colors.black),),
                    )
                  ],),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}







