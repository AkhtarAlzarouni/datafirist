class ProductModel{
  String? name;
  String? catogry;
  double? price;


  ProductModel({this.name,this.catogry,this.price});
  
  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "catogry":catogry,
      "price":price
    };
  }

}