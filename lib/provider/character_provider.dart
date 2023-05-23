import 'package:flutter/material.dart';

import '../services/rick&morty.services.dart';

class CharacterProvider with ChangeNotifier {
  // List _listCharacter = [];
  Map _charater = {};
  String _episode = '';
  bool _isloading = false;
  List _characterList =[];

  // List get listCharacter => _listCharacter;
  Map get charater => _charater;
  bool get isLoading => _isloading;
  String get episode => _episode;
  List get characterList => _characterList;

  Future charecterList({required character}) async {
    _isloading = true;
    notifyListeners();
    _charater = character;
    var episode = await RickAndMorty().getEpisode(character['episode'][0]);
    var characterList = await RickAndMorty().getCharactersComplementarios(character['id']);
    _episode = episode;
    _characterList = characterList;
    _isloading = false;
    notifyListeners();
  }
}