import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_supermarket/models/order.dart' as MyOrder;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class Order_service extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger(printer: PrettyPrinter());



  Future<void> createOrder(MyOrder.Order order) async {
    try {
      var orderCol = _firestore.collection("Orders");
      await orderCol.add(order.toJson());
    }
    catch (e) {
      logger.e("Ошибка при создании заказа: $e");
      throw e;
    }
  }



  Future<void> updateOrder(MyOrder.Order order) async {
    try {
      var orderRef = _firestore.collection("Orders").doc(order.Id);
      await orderRef.update(order.toJson());
    }
    catch (e) {

      logger.e("Ошибка при обновлении заказа: $e");
      throw e;
    }
  }



  Future<void> deleteOrder(String orderId) async {
    try {
      var orderRef = _firestore.collection("Orders").doc(orderId);
      await orderRef.delete();
    }

    catch (e) {

      logger.e("Ошибка при удалении заказа: $e");
      throw e;
    }
  }
}
