import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import './screens/base_screen.dart';
import './screens/screen_state.dart';

class SaveRedSquare extends FlameGame with TapDetector {
  late ScreenState _screenState;
  late BaseScreen _menuScreen;
  late BaseScreen _playgroundScreen;
  late BaseScreen _scoreScreen;

  SaveRedSquare() {
    _screenState = ScreenState.kMenuScreen;
  }

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

  BaseScreen _getActiveScreen() {
    switch (_screenState) {
      case ScreenState.kMenuScreen:
        return _menuScreen;
      case ScreenState.kPlaygroundScreen:
        return _playgroundScreen;
      case ScreenState.kScoreScreen:
        return _scoreScreen;
      default:
        return _menuScreen;
    }
  }
}
