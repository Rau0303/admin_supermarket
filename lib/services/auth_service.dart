import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid ;
  String get uid => _uid!;
  var logger = Logger(printer: PrettyPrinter());


  // Регистрация по электронной почте и паролю
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      logger.e("Ошибка при регистрации: $e");
      throw e;
    }
  }

  // Аутентификация по электронной почте и паролю
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      logger.e("Ошибка при входе: $e");
      throw e;
    }
  }


// Аутентификация по номеру телефона
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential = await _auth.signInWithCredential(credential);
          // обработка верификации
        },
        verificationFailed: (FirebaseAuthException e) {
          logger.e("Ошибка верификации номера телефона: $e");
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          // Обработка отправки кода подтверждения
          logger.i('Код подтверждения отправлен на номер $phoneNumber');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Обработка таймаута автоматического извлечения кода
          logger.i('Таймаут автоматического извлечения кода. Попробуйте запросить код повторно.');
        },
      );
    } catch (e) {
      logger.e("Ошибка при входе по номеру телефона: $e");
      throw e;
    }
  }


  void veridyOtp({
    required BuildContext context,
    required String userOtp,
    required String verificationId,
    required Function onSuccess
  })async{
    notifyListeners();
    try{
      PhoneAuthCredential creds = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOtp);
      User? user = (await _auth.signInWithCredential(creds)).user!;
      if(user != null){
        _uid = user.uid;
        onSuccess();
      }

      notifyListeners();
    } on FirebaseAuthException catch(e){
      logger.e("Ошибка =>> $e");
      notifyListeners();
    }
  }

  // Выход из системы
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Получение текущего пользователя
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
