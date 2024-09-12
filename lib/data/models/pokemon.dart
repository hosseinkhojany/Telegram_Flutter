import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 1)
class Pokemon extends HiveObject {
  Pokemon(this.name, this.url, this.color, this.page);

  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  int color = 0;
  @HiveField(3)
  int page = 0;

  String getImage() {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${url.split("/")[url.split("/").length - 2]}.png";
  }

  factory Pokemon.fromJson(Map<String, dynamic> json, int page) {
    return Pokemon(
      json["name"],
      json["url"],
      Colors.black12.value,
      page,
    );
  }
}
