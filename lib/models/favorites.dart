import 'package:admin_supermarket/models/basket.dart';
import 'package:admin_supermarket/models/product.dart';

class Favorites {
  late var Id;
  late var user_id;
  late List<Product> products;

  Favorites({
    required this.Id,
    required this.user_id,
    required this.products,
  });


//Метод конвертации объекта в json формат
  Map<String, dynamic> toJson(){
    return {
      'Id': Id,
      'User_id': user_id,
      'Products': products.map((product) => product.toJson()),
    };
  }


//Метод создания объекта из json
  Favorites fromJson(Map<String, dynamic> json){
    var ProductsList = json['Prooducts'] as List<dynamic>;
    return Favorites(
        Id: json['Id'],
        user_id: json['User_id'],
        products: ProductsList.map((product) => Product.fromJson(product)).toList(),
    );
  }

}