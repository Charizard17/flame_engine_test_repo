import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import './my_game.dart';
import 'control_buttons.dart';

void main() {
  print('main file');

  final game = MyGame();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            GameWidget(game: game),
            ControlButtons(game: game),
          ],
        ),
      ),
    ),
  );
}
