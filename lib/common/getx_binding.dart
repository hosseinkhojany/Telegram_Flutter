import 'package:get/get.dart';
import 'package:telegram_flutter/data/datasources/remote/pokemon_datasource.dart';
import 'package:telegram_flutter/data/repositories/pokemon_repository.dart';
import 'package:telegram_flutter/domain/controller/pokemonController.dart';


import '../domain/controller/emoji_controller.dart';

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmojiController());
    Get.lazyPut(
        () => PokemonController(PokemonRepository(PokemonDs(Get.find()))));
  }
}
