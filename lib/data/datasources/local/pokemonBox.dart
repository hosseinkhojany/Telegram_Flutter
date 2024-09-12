import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:telegram_flutter/data/config/hive/hiveConfig.dart';
import 'package:telegram_flutter/data/models/pokemon.dart';
import 'package:telegram_flutter/data/models/pokemonInfo.dart';


class PokemonBox{

  static String _boxKey(int page){
    return POKEMON_BOX+page.toString();
  }

  static Future<bool> insertListPokemon(List<Pokemon> data, int page) async {
    try{
      final box = await Hive.openBox(_boxKey(page));
      for (var element in data) {
        box.put(element.name, element);
      }
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<List<Pokemon>> getListPokemon(int page) async {
    try{
      List<Pokemon> result = [];
      final box = await Hive.openBox(_boxKey(page));
      for (var element in box.keys) {
        result.add(box.get(element));
      }
      return result;
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<bool> insertPokemonInfo(PokemonInfo pokemonInfo) async {
    try{
      final box = await Hive.openBox<PokemonInfo>(pokemonInfo.name);
      box.put(pokemonInfo.name, pokemonInfo);
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<PokemonInfo?> getPokemonInfo(String pokemonName) async{
    try{
      final box = await Hive.openBox<PokemonInfo>(pokemonName);
      return box.get(pokemonName);
    }catch(e){
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<bool> updatePokemonColor(int page, String pokemonName, int color) async{
    try{
      final box = await Hive.openBox(_boxKey(page));
      Pokemon? pokemon = box.get(pokemonName);
      pokemon!.color = color;
      box.put(pokemonName, pokemon);
      return true;
    }catch(e){
      debugPrint(e.toString());
      return false;
    }
  }

}
