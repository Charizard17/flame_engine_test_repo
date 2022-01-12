import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class SaveRedSquare extends FlameGame with TapDetector {
  @override
  void render(Canvas canvas) {
    // print('Render');
  }

  @override
  void update(double t) {
    // print('Update');
  }

  @override
  void resize(Size size) {
    //
  }

  @override
  void onTapDown(TapDownInfo details) {
    print('tap!');
  }
}
