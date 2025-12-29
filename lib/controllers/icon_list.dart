import 'dart:math';
import 'package:flutter/material.dart';

class RandomThing {
  final randCo = [
    Colors.red,
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.white54,
    Colors.deepPurpleAccent,
  ];

  final randomLogo = [
    'assets/icons/download_3.png',
    'assets/icons/Google.png',
    'assets/icons/Facebook.png',
  ];

  Color colorByIndex(int index) {
    return randCo[index % randCo.length];
  }

  String imageByIndex(int index) {
    return randomLogo[index % randomLogo.length];
  }
}
