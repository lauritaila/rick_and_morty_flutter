// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.model.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _singIn = false;

  bool get singIn => _singIn;

  Future logIn(UserModel usuario) async {
    try {
      _singIn = false;
      await _auth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.password);
      _singIn = true;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      print(e);
      _singIn = false;
      notifyListeners();
    }
  }
}
