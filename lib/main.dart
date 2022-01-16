import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import './my_game.dart';

void main() {
  print('main file');

  final myGame = MyGame();
  runApp(
    GameWidget(game: myGame),
  );
}
