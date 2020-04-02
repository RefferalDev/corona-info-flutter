import 'dart:ui';

import 'package:corona/utils/color_util.dart';

enum ThemeColor {
  primary,
  secondary,
  blackText,
  greyText,
  grey,
  greyTextDesc,
  greyYoung,
}

class AppStyle {
  static Color getColor([ThemeColor color = ThemeColor.primary]) {
    switch (color) {
      case ThemeColor.blackText:
        return HexColor("#101011");
      case ThemeColor.primary:
        return HexColor("#1EB7ED");
      case ThemeColor.secondary:
        return HexColor("#FFFFFF");
      case ThemeColor.greyText:
        return HexColor("#CACCCD");
      case ThemeColor.grey:
        return HexColor("BFC0C2");
      case ThemeColor.greyYoung:
        return HexColor("F8FAFB");
      case ThemeColor.greyTextDesc:
        return HexColor("#A5A7A9");
      default:
        return HexColor("FFFFFF");
    }
  }
}
