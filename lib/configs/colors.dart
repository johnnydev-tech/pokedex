import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomColor {
  static const variable = Color(0xFF84B5C4);
  static const primary = Color(0xFF78C5DE);
  static const secondary = Color(0xFF95856C);
  static const rose = Color(0xFFFFBEBE);
  static const brown = Color(0xFFC6BDAC);
  static const brownlight = Color(0xFFD8D3CD);
  static const yellowlight = Color(0xFFFFE8BE);
  static const background = Color(0xFFF4F4F4);
  static const transparent = Colors.transparent;
  static const white = Color(0xffFFFFFF);
  static const lighterGrey = Color(0xFFE8E6E4);
  static const lightGrey = Color(0xff999990);
  static const grey = Color(0xff858585);
  static const darkGrey = Color(0xff3A3A3A);
  static const black = Color(0xFF000000);
  static const green = Color(0xFF82BF9C);
  static const lightGreen = Color(0xFF85DDBB);

  static Color getColorType({String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400].withOpacity(1);
        break;
      case 'Fire':
        return Colors.red;
        break;
      case 'Water':
        return Colors.blue;
        break;
      case 'Grass':
        return Colors.green;
        break;
      case 'Electric':
        return Colors.amber;
        break;
      case 'Ice':
        return Colors.cyanAccent[400].withOpacity(1);
        break;
      case 'Fighting':
        return Colors.orange;
        break;
      case 'Poison':
        return Colors.purple;
        break;
      case 'Ground':
        return Colors.orange[300].withOpacity(1);
        break;
      case 'Flying':
        return Colors.indigo[200].withOpacity(1);
        break;
      case 'Psychic':
        return Colors.pink;
        break;
      case 'Bug':
        return Colors.lightGreen[500].withOpacity(1);
        break;
      case 'Rock':
        return Colors.grey;
        break;
      case 'Ghost':
        return Colors.indigo[400].withOpacity(1);
        break;
      case 'Dark':
        return Colors.brown;
        break;
      case 'Dragon':
        return Colors.indigo[800].withOpacity(1);
        break;
      case 'Steel':
        return Colors.blueGrey;
        break;
      case 'Fairy':
        return Colors.pinkAccent[100].withOpacity(1);
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
