




import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:realmeta_test/component/bottom_bar.dart';
import 'package:realmeta_test/component/text_form_widget.dart';
import 'package:realmeta_test/screens/Dashboard_screen/controller/product_controller.dart';
import 'package:realmeta_test/screens/product_page/product.dart';


class ProductList extends StatelessWidget {
   ProductList({super.key});


  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return  (Obx(()=>Scaffold(
      body: productController.isLoaded.value==false?const SizedBox(
        width: double.infinity,height: double.infinity,
        child:  Center(
          child: CircularProgressIndicator(),
        ),
    ):SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
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
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 80,
                    // color: Colors.blue,
                    child: GestureDetector(
                      onTap: (){
                        Get.to(ProductPage(id:productController.productList[index].id),);
                      },
                      child: Row(
                        children: [
                          Expanded(child:Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey.shade400,
                                foregroundImage: NetworkImage(
                                    productController.productList[index].image
                                ),
                                child: const Icon(Icons.person,size: 40,color: Colors.white,),
                              ),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: SizedBox(
                                  height: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 20),
                                        width: double.infinity,
                                        child: Text(
                                          productController.productList[index].title,
                                          maxLines: 3,overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          productController.productList[index].category,
                                        style: const TextStyle(
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
                          )),
                          Container(
                            height: double.infinity,
                            alignment : Alignment.center,
                            child: const Text(
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
                  return const SizedBox(height: 5,);
                },
                itemCount: productController.productList.length)
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    )));
  }
}









