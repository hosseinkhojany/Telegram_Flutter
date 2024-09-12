
import 'package:flutter/cupertino.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension ScreenSizeGameCardExt on BuildContext{
  bool isHorizontalScreen(){
    if(MediaQuery.of(this).size.width < MediaQuery.of(this).size.height){
      //use horizontal |
      return true;
    } else {
      //use vertical __
      return false;
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension NullCheckObject on Object? {
  void whatIfNotNull(Function() action) {
    if (this != null) {
      action();
    }
  }
}

extension NullCheckFunction on Function? {
  void whatIfNotNull(Function() action) {
    if (this != null) {
      action();
    }
  }
}

extension NullCheckKey on Key? {
  void whatIfNotNull(Function() action) {
    if (this != null) {
      action();
    }
  }
}

