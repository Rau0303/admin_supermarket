import 'package:uuid/uuid.dart';



class Product{
  late var Id;
  late String title;
  late String description;
  late int count;
  late double price;
  late String photoURL;



  Product({
    required this.Id,
    required this.title,
    required this.description,
    required this.price,
    required this.count,
    required this.photoURL
  });


//Метод конвертации объекта в json формат
  Map<String, dynamic> toJson(){
    return {
      'Id': Id,
      'Title': title,
      'Description': description,
      'Price': price,
      'Count': count,
      'PhotoURL': photoURL
    };
  }




//Метод создания объекта из json
  static Product fromJson(Map<String, dynamic> json){
    return Product(
        Id: json['Id'],
        title: json['Title'],
        description: json['Description'],
        price: json['Price'],
        count: json['Count'],
        photoURL: json['PhotoURL']
    );
  }


}