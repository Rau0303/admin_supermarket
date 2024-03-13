import 'package:admin_supermarket/models/product.dart';

class Basket{
  late var Id;
  late var user_id;
  late List<Product> products;
  late double total;


  Basket({
    required this.Id,
    required this.user_id,
    required this.products,
    required this.total,
  });

//Метод конвертации объекта в json формат
  Map<String,dynamic> toJson(){
    return{
      'Id': Id,
      'User_id': user_id,
      'Products': products.map((product) => product.toJson()).toList(),
      'Total': total,
    };
  }



//Метод создания объекта из json
  Basket fromJson(Map<String,dynamic> json){
    var productsJson = json['Products'] as List<dynamic>;
    return Basket(
        Id: json['Id'],
        user_id: json['User_id'],
        products: productsJson.map((product) => Product.fromJson(product)).toList(),
        total: json['Total']
    );
  }
}