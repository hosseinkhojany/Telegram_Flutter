import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:telegram_flutter/common/utils/paletteUtil.dart';
import 'package:telegram_flutter/domain/controller/pokemonController.dart';
import 'package:telegram_flutter/presentation/globalWidgets/improvedScrolling/lazy_load_scrollview.dart';
import 'package:telegram_flutter/presentation/globalWidgets/improvedScrolling/responsiveGridList/responsive_grid_list.dart';
import 'package:telegram_flutter/presentation/globalWidgets/pokemonList/pokemon_item.dart';

class PokemonList extends StatelessWidget {
  final PokemonController controller;

  PokemonList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      onEndOfPage: controller.loadNextPage,
      isLoading: controller.lastPage,
      child: ResponsiveGridList(
        horizontalGridMargin: 10,
        verticalGridMargin: 10,
        minItemWidth: 150,
        children: List.generate(
          controller.pokemons.length,
          (index) {
            final pokemon = controller.pokemons[index];

            return FutureBuilder<PaletteGenerator>(
              future: PaletteUtil.updatePaletteGenerator(pokemon.getImage()),
              builder: (context, snapshot) {
                if (pokemon.color != Colors.black12.value) {
                  return PokemonItem(
                      pokemon: pokemon, dominantColor: Color(pokemon.color));
                } else {
                  PokemonController controller = Get.find();
                  var dominantColor = snapshot.data?.dominantColor?.color ??
                      Color(pokemon.color);
                  controller.updatePokemonColor(
                      pokemon.page, pokemon.name, dominantColor.value);
                  return PokemonItem(
                      pokemon: pokemon, dominantColor: dominantColor);
                }
              },
            );
          },
        ),
      ),
    );
    ;
  }
}
