import 'package:admin_supermarket/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProductService extends ChangeNotifier {
  var logger = Logger(printer: PrettyPrinter());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;



  Future<void> addProduct(Product product) async {
    try {
      var productCol = _firestore.collection("Products");
      final productsRef = productCol.doc(product.Id);
      await productsRef.set(product.toJson());
    } catch (e) {
      logger.e("Ошибка при добавлении товара! $e");
    }
  }



  Future<void> updateProduct(Product product) async {
    try {
      final productRef = _firestore.collection("Products").doc(product.Id);
      final doc = await productRef.get();

      if (doc.exists) {
        await productRef.update(product.toJson());
      } else {
        await addProduct(product);
      }
    } catch (e) {
      logger.e("Что-то пошло не так! $e");
    }
  }



  Future<void> deleteProduct(String productId) async {
    try {
      await _firestore.collection('Products').doc(productId).delete();
    } catch (e) {
      logger.e("Что-то пошло не так! $e");
    }
  }



  Future<List<Product>> getProducts() async {
    try {
      var snapshot = await _firestore.collection("Products").get();
      List<Product> products = [];
      snapshot.docs.forEach((doc) {
        products.add(Product.fromJson(doc.data()));
      });
      return products;
    } catch (e) {
      logger.e("Ошибка => $e");
      return [];
    }
  }



}
