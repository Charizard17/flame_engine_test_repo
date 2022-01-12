import 'package:flame/game.dart';

import './save_red_square.dart';
import 'package:flutter/material.dart';

void main() {
  SaveRedSquare saveRedSquare = SaveRedSquare();

  runApp(
    GameWidget(
      game: saveRedSquare,
    ),
  );
}
