import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/cupertino.dart';

class PaletteUtil {
  static Future<PaletteGenerator> updatePaletteGenerator(
      String imageUrl) async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.file(await DefaultCacheManager().getSingleFile(imageUrl)).image,
    );
    return paletteGenerator;
  }

}
