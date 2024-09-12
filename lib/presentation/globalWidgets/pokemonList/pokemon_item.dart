import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:telegram_flutter/data/models/pokemon.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    Key? key,
    required this.pokemon,
    required this.dominantColor,
  }) : super(key: key);

  final Pokemon pokemon;
  final Color dominantColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
            width: 160,
            height: 210,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(pokemon.color).withOpacity(0.6),
                blurRadius: 15,
              )
            ])),
        Card(
          color: Colors.black12,
          elevation: 5,
          shadowColor: Color(pokemon.color).withOpacity(0.6),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 150,
            height: 200,
            color: dominantColor.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: pokemon.getImage(),
                      width: 90,
                      placeholder: (context, url) {
                        return Center(
                          child: SkeletonGridLoader(
                            builder: SingleChildScrollView(
                              child: GridTile(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("assets/images/pokemon.png"),
                                  ],
                                ),
                              ),
                            ),
                            items: 1,
                            itemsPerRow: 1,
                            period: const Duration(milliseconds: 2500),
                            baseColor: Color(pokemon.color).withOpacity(0.1),
                            highlightColor: Colors.black26,
                            direction: SkeletonDirection.ltr,
                            childAspectRatio: 1,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            pokemon.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
