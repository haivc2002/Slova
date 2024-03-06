import 'dart:ui';
import 'package:flutter/widgets.dart';

class ColorPalette {
  static const Color oragerColor = Color(0xFFF88125);
  static const Color backgroudApp = Color(0xFFF9F9F9);
  static const Color accentColor = Color(0xFF66cc33);
}

class ColorPaletteProvider extends InheritedWidget {
  final ColorPalette colorPalette;

  const ColorPaletteProvider({
    Key? key,
    required Widget child,
    required this.colorPalette,
  }) : super(key: key, child: child);

  static ColorPaletteProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorPaletteProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
