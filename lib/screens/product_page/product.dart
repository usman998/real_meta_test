



import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: productController.isLoaded.value==false?Container(
        width: double.infinity,height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ):
      Column(
        children: [
          SizedBox(height:30,),
          Container(
            // height: 90,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,size: 40,)),
                Expanded(
                  child: Container(
                    // height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productController.result["category"]??"",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            productController.result["title"]??"",
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Icon(Icons.shopping_bag,size: 40,),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
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
                    padding: EdgeInsets.only(right: 30,bottom: 20),
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
                            offset: Offset(0, 3), // changes position of shadow
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
                    padding: EdgeInsets.only(left: 20),
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
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(child: Padding(
                                    padding: EdgeInsets.only(left:_width*0.05 ),
                                    child: Row(
                                      children:  [
                                        SizedBox(width: 10,),
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
          SizedBox(height: 40,)
          // LeftTopCurvedButton(height: _height, width: _width,product: data,)
        ],
      ),
    )));
  }
}








class ColoredCircle extends StatelessWidget {
  const ColoredCircle({
    Key? key,
    required this.height,
    required this.width,
    required this.boxColor,
    required this.borderColor,
  }) : super(key: key);

  final double height;
  final double width;
  final Color boxColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height*0.03 ,width: width*0.05,
      decoration: BoxDecoration(

          color: boxColor,
          shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(3),
      child: Container(
        height:height*0.03 ,width: width*0.05,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor,width: 2),
            color: boxColor,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}



class HeadingBar extends StatelessWidget {
  HeadingBar({
    Key? key,
    this.leftPad =0,
    this.rightPad=0,
    this.bottomPad=0,
    required this.text,
    this.fontSize = 17,
    this.maxlines=1,
    this.fontWeight =FontWeight.w400,
    this.widgetAlign = Alignment.centerLeft,
    this.textColor=Colors.black45,
    this.topPad=0}) : super(key: key);



  final double leftPad;
  final double rightPad;
  final double bottomPad;
  final double topPad;
  final int maxlines;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment widgetAlign;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: leftPad,right: rightPad,bottom: bottomPad,top: topPad),
      alignment: widgetAlign,
      child: Text(
        text,maxLines:maxlines,overflow:TextOverflow.ellipsis,style: TextStyle(
        color: textColor,fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      ),
    );
  }
}
