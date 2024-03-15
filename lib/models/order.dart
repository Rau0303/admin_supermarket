import 'package:admin_supermarket/models/product.dart';

class Order {
  late var Id;
  late var user_id;
  late String address;
  late List<Product> products;
  late double total;
  late DateTime createdAt;



  Order({
    required this.Id,
    required this.user_id,
    required this.address,
    required this.products,
    required this.total,
    required this.createdAt,
  });



  // Метод конвертации объекта в JSON формат
  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'User_id': user_id,
      'Address': address,
      'Products': products.map((product) => product.toJson()).toList(),
      'Total': total,
      'CreatedAt': createdAt.toIso8601String(),
    };
  }



  // Метод создания объекта из JSON
  static Order fromJson(Map<String, dynamic> json) {
    var productsJson = json['Products'] as List<dynamic>;
    return Order(
      Id: json['Id'],
      user_id: json['User_id'],
      address: json['Address'],
      products: productsJson.map((productJson) => Product.fromJson(productJson)).toList(),
      total: json['Total'],
      createdAt: DateTime.parse(json['CreatedAt']),
    );
  }
}
