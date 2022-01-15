import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

void main() {
  print('main file');

  final myGame = MyGame();
  runApp(
    GameWidget(game: myGame),
  );
}

class MyGame extends FlameGame with DoubleTapDetector {
  SpriteComponent girl = SpriteComponent();
  bool running = true;
  String direction = 'down';

  @override
  Future<void> onLoad() async {
    print('loading....');
    girl
      ..sprite = await loadSprite('girl.png')
      ..size = Vector2(100.0, 100.0)
      ..x = 150
      ..y = 50;
    add(girl);
  }

  @override
  void update(double dt) {
    super.update(dt);

    switch (direction) {
      case 'down':
        girl.y += 2;
        break;
      case 'up':
        girl.y -= 2;
        break;
    }

    if (girl.y > 400) {
      direction = 'up';
    }
    if (girl.y < 20) {
      direction = 'down';
    }
  }

  @override
  void onDoubleTap() {
    if (running) {
      pauseEngine();
    } else {
      resumeEngine();
    }
    running = !running;
  }
}
