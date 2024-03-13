import 'package:admin_supermarket/models/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class Admin_service extends ChangeNotifier{
  var logger = Logger(printer: PrettyPrinter());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;


  //КРУД операции
  Future<void> addUser(Admin admin)async{
    try{

      final admins = _firebaseFirestore.collection("Admins");
      final adminRef = admins.doc(admin.Id);
      await adminRef.set(admin.toJson());
    }
    catch(e){
      logger.e("error => $e");
    }
  }


  Future<void> updateAdmin(Admin admin) async{
    try{
      final adminRef = _firebaseFirestore.collection("Admins").doc(admin.Id);
      final doc = await adminRef.get();

      if(doc.exists){
        await adminRef.update(admin.toJson());
      }
      else{
        await addUser(admin);
      }
    }
    catch(e){
      logger.e("error => $e");
    }

  }


  Future<void> deleteAdmin() async{
    try{
      final admin = FirebaseAuth.instance.currentUser;
      if (admin == null) {
        throw Exception('User is not logged in');
      }
      await _firebaseFirestore.collection('Admins').doc(admin.uid).delete();

      await admin.delete();
    }
    catch(e){
      logger.e("error => $e");
    }
  }


  Future<Admin?> getAdmin() async{
    try{
      final admin = _firebaseAuth.currentUser;
      if(admin!=null){
        final snapshot = await _firebaseFirestore.collection("Admins").doc(admin.uid).get();
        if(snapshot.exists){
          final data = snapshot.data() as Map<String, dynamic>;
          return Admin.fromJson(data);
        }
      }
      else{
        return null;
      }
    }
    catch(e){
      logger.e("error => $e");
    }
  }



}