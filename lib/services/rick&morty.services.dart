import 'package:dio/dio.dart';

class RickAndMorty{
  Future<Map> getCharecters() async{
    var resp = await Dio().get('https://rickandmortyapi.com/api/character');
    return resp.data;
  }
  Future<String> getEpisode(url) async{
    var resp = await Dio().get(url);
    return resp.data['name'];
  }
  Future<List> getCharactersComplementarios(int id) async{
    var resp = await Dio().get('https://rickandmortyapi.com/api/character/[${id+1},${id+3},${id+4}]');
    return resp.data;
  }
}