



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realmeta_test/component/color_circle.dart';
import 'package:realmeta_test/component/heading_bar.dart';
import 'package:realmeta_test/screens/product_page/controller/single_product_controller.dart';

class ProductPage extends StatelessWidget {

  ProductPage({required this.id});

  final String id;


  final SingleProductController productController = Get.put(SingleProductController());
  @override
  Widget build(BuildContext context) {
    productController.getAllResult(id);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return (Obx(()=>Scaffold(
      body: productController.isLoaded.value==false?const SizedBox(
        width: double.infinity,height: double.infinity,
        child:  Center(
          child: CircularProgressIndicator(),
        ),
      ):
      Column(
        children: [
          const SizedBox(height:60,),
          Container(
            // height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back,size: 40,)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productController.result["category"]??"",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          productController.result["title"]??"",
                          maxLines: 1,overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const Icon(Icons.shopping_bag,size: 40,),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    height: _height*0.3,
                    decoration:  BoxDecoration(
                        borderRadius: const  BorderRadius.only(bottomLeft: Radius.circular(70)),
                        image: DecorationImage(
                            image: NetworkImage(productController.result["image"]),
                            fit: BoxFit.contain
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 30,bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(Icons.favorite,color: Colors.grey.shade300,),
                    ),
                  ),
                  HeadingBar(text:productController.result["description"].toString()??"",
                    leftPad:_width*0.05 ,
                    fontSize: 15,topPad: 0,rightPad:_width*0.05,fontWeight: FontWeight.w500,
                    textColor: Colors.grey.shade600,maxlines: 4,),
                  SizedBox(height: _height*0.02,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: HeadingBar(text: "COLOR",leftPad:_width*0.05 ,fontSize: 15,topPad: 0,fontWeight: FontWeight.bold,textColor: Colors.black,),),
                                  Expanded(child: HeadingBar(text: "Size",leftPad:_width*0.05 ,fontSize: 15,topPad: 0,fontWeight: FontWeight.bold,textColor: Colors.black,),),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(child: Padding(
                                    padding: EdgeInsets.only(left:_width*0.05 ),
                                    child: Row(
                                      children:  [
                                        const SizedBox(width: 10,),
                                        ColoredCircle(height: _height, width: _width, boxColor: Colors.blue, borderColor: Colors.blue),
                                        const SizedBox(width: 5,),
                                        ColoredCircle(height: _height, width: _width, boxColor: Colors.green, borderColor: Colors.green),
                                        const SizedBox(width: 5,),
                                        ColoredCircle(height: _height, width: _width, boxColor: Colors.yellow, borderColor: Colors.yellow),
                                        const SizedBox(width: 5,),
                                        ColoredCircle(height: _height, width: _width, boxColor: Colors.red, borderColor: Colors.red),
                                      ],
                                    ),
                                  ),),
                                  Expanded(child: HeadingBar(text: "10.1",leftPad:_width*0.05 ,fontSize: 15,topPad: 0,fontWeight: FontWeight.bold,textColor: Colors.black45,),),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: _height*0.02,),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(child: HeadingBar(text: "Add to Bag",leftPad:_width*0.05 ,fontSize: 20,topPad: 0,fontWeight: FontWeight.bold,textColor: Colors.black,),),
              Expanded(
                child: HeadingBar(
                  widgetAlign: Alignment.centerRight,
                  text: productController.result["price"].toString(),rightPad:_width*0.05 ,fontSize: 20,topPad: 0,fontWeight: FontWeight.bold,textColor: Colors.black45,),),
            ],
          ),
          const SizedBox(height: 40,)
          // LeftTopCurvedButton(height: _height, width: _width,product: data,)
        ],
      ),
    )));
  }
}













