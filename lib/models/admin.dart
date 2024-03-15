import 'package:admin_supermarket/models/order.dart';
import 'package:admin_supermarket/models/product.dart';
import 'package:admin_supermarket/models/users.dart';


class Admin extends Users{
  late List<Product> products;
  late List<Order> orders;

  Admin({
    required super.Id ,
    required super.name,
    required super.phoneNumber,
    required this.products,
    required this.orders
  });

//Метод конвертации объекта в json формат
  Map<String, dynamic> toJson(){
    return{
      'Id':Id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Products': products.map((product) => product.toJson()).toList(),
      'Orders': orders.map((order) => order.toJson()).toList(),
    };
  }




//Метод создания объекта из json
  static Admin fromJson(Map<String,dynamic> json){
    var productsList = json['Products'] as List<dynamic>;
    var orderList = json['Orders'] as List<dynamic>;
    return Admin(
        Id: json['Id'],
        name: json['Name'],
        phoneNumber: json['PhoneNumber'],
        products: productsList.map((product) => Product.fromJson(product)).toList(),
        orders: orderList.map((order) => Order.fromJson(order)).toList(),
    );
  }

}