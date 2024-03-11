import 'package:flutter/material.dart';

class GetTypeColors {
  Color getColorForType(String type) {
    switch (type) {
      case 'Grass':
        return const Color(0XFF45d0b0);
      case 'Poison':
        return const Color(0XFFB567CE);
      case 'Bug':
        return const Color(0XFF91C12F);
      case 'Normal':
        return const Color(0XFF919AA2);
      case 'Ground':
        return const Color(0XFFD97845);
      case 'Fighting ':
        return const Color(0XFFCE416B);
      case 'Psychic  ':
        return const Color(0XFFFA7179);
      case 'Water':
        return const Color(0XFF77befe);
      case 'Dragon  ':
        return const Color(0XFFCBBE48);
      case 'Rock':
        return const Color(0XFFC5B78C);
      case 'Ice':
        return const Color(0XFF77befa);
      case 'Fire':
        return const Color(0xFFFF9D55);
      case 'Ghost':
        return const Color(0XFF5269AD);
      case 'Electric':
        return const Color(0XFFffd970);
      default:
        return const Color(0XFFFFD86F);
    }
  }
}
