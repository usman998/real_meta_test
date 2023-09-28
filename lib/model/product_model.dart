

class Product{
  String id = "";
  String title = "";
  String price = "";
  String description = "";
  String category = "";
  String image = "";

  Product.empty();



  Product.fromJson({required Map<String,dynamic> json}){
    id =  json["id"]!=null?json["id"].toString() :"";
    title =  json["title"]!=null?json["title"].toString() :"";
    price =  json["price"]!=null?json["price"].toString() :"";
    description =  json["description"]!=null?json["description"].toString() :"";
    category =  json["category"]!=null?json["category"].toString() :"";
    image =  json["image"]!=null?json["image"].toString() :"";
  }


}