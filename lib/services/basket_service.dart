import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_supermarket/models/basket.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Basket_service extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger(printer: PrettyPrinter());

  Future<void> createBasket(Basket basket) async {
    try {
      var basketCol = _firestore.collection("Baskets");
      await basketCol.doc(basket.Id).set(basket.toJson());
    } catch (e) {
      logger.e("Ошибка при создании корзины: $e");
      throw e;
    }
  }

  Future<void> updateBasket(Basket basket) async {
    try {
      var basketRef = _firestore.collection("Baskets").doc(basket.Id);
      await basketRef.update(basket.toJson());
    } catch (e) {
      logger.e("Ошибка при обновлении корзины: $e");
      throw e;
    }
  }

  Future<void> deleteBasket(String basketId) async {
    try {
      var basketRef = _firestore.collection("Baskets").doc(basketId);
      await basketRef.delete();
    } catch (e) {
      logger.e("Ошибка при удалении корзины: $e");
      throw e;
    }
  }
}
