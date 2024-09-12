import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_flutter/common/utils/consts.dart';
import 'package:telegram_flutter/domain/controller/pokemonController.dart';
import 'package:telegram_flutter/presentation/globalWidgets/pokemonList/pokemon_list.dart';

class PokemonListScreen extends StatefulWidget {
  final PokemonController _controller;

  const PokemonListScreen(this._controller, {Key? key}) : super(key: key);

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset("assets/images/ic_icon.png"),
        ),
        title: const Text("Pokedex Flutter"),
      ),
      body: Obx(() {
        switch (widget._controller.requestStateListPokemon.value) {
          case RequestState.LOADING:
            if (widget._controller.pokemons.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: SizedBox(
                      height: 20,
                      child: Center(
                        child: Stack(
                          children: const [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Loading..."),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
              return PokemonList(controller: widget._controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          case RequestState.ERROR:
            if (widget._controller.pokemons.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: SizedBox(
                      height: 40,
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("failed to load more pokemons"),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () =>
                                  {widget._controller.loadNextPage()},
                              icon: const Icon(
                                Icons.refresh_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
              return PokemonList(controller: widget._controller);
            } else {
              return Center(
                child: IconButton(
                  tooltip: "retry",
                  icon: const Icon(Icons.refresh_outlined),
                  onPressed: () => {
                    widget._controller.loadNextPage(true),
                  },
                ),
              );
            }
          default:
            return PokemonList(controller: widget._controller);
        }
      }),
    );
  }
}
