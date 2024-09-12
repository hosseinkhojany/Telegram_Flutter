import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'pokemonInfo.g.dart';

List<String> typesFromJson(List<dynamic> str) {
  List<String> result = [];
  str.forEach((element) {
    result.add((((element as Map<String, dynamic>)['type'])
            as Map<String, dynamic>)['name'] ??
        "");
  });
  return result;
}

@HiveType(typeId: 2)
class PokemonInfo extends HiveObject {
  PokemonInfo([
    this.id = 0,
    this.name = "",
    this.height = 0,
    this.weight = 0,
    this.base_experience = 0,
    this.types = const <String>[],
    this.hp = 0,
    this.attack = 0,
    this.defense = 0,
    this.speed = 0,
    this.exp = 0]
  );

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int height;
  @HiveField(3)
  int weight;
  @HiveField(4)
  int base_experience;
  @HiveField(5)
  List<String> types;
  @HiveField(6)
  int hp;
  @HiveField(7)
  int attack;
  @HiveField(8)
  int defense;
  @HiveField(9)
  int speed;
  @HiveField(10)
  int exp;

  factory PokemonInfo.fromJson(Map<String, dynamic> json) => PokemonInfo(
      json["id"],
      json["name"],
      json["height"],
      json["weight"],
      json["base_experience"],
      typesFromJson(json["types"]),
      Random.secure().nextInt(300),
      Random.secure().nextInt(300),
      Random.secure().nextInt(300),
      Random.secure().nextInt(300),
      Random.secure().nextInt(1000));
}
