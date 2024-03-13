import 'package:admin_supermarket/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Product_sercive extends ChangeNotifier{
  var logger = Logger(printer: PrettyPrinter());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  Future<void> addProduct(Product product) async{
    try{

      // сурет косу керек

      var productCol = _firestore.collection("Products");
      final productsRef = productCol.doc(product.Id);
      await productsRef.set(product.toJson());


    }
    catch(e){
      logger.e("Ошибка при добавлении товара! $e");
    }
  }

  Future<void> updatePrice(double price) async{
    try{
      /*final adminRef = _firestore.collection("Admins").doc();
      final doc = await adminRef.get();*/
    }
    catch(e){
      logger.e("Что то пошло не так! $e");
    }
  }

  Future<void> deleteProduct()async{
    try{
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User is not logged in');
      }
      await _firestore.collection('Products').doc(user.uid).delete();
    }
    catch(e){
      logger.e("Что то пошло не так! $e");
    }
  }


}