import 'package:flutter/material.dart';

import '../Theme/Color.dart';

PreferredSizeWidget headerBar(String ? titleHeader, bool status) {
  return AppBar(
    automaticallyImplyLeading: status,
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: ColorPalette.oragerColor,
    title: Text(titleHeader ?? '', style: const TextStyle(color: Colors.white),),
  );
}