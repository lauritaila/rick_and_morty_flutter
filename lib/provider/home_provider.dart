import 'package:flutter/material.dart';
import 'package:rick_and_morty/services/rick&morty.services.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  List _charaters = [];

  bool get isLoading => _isLoading;
  List get charaters => _charaters;

  Future charecterList() async {
    try {
      _isLoading = true;
      notifyListeners();
      Map list = await RickAndMorty().getCharecters();
      _isLoading = false;
      _charaters = list['results'];
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _charaters = [];
      notifyListeners();
    }
  }
}
