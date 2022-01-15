import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

void main() {
  print('main file');

  final myGame = MyGame();
  runApp(
    GameWidget(game: myGame),
  );
}

class MyGame extends FlameGame {
  SpriteComponent girl = SpriteComponent();

  @override
  Future<void> onLoad() async {
    print('loading....');

    girl
      ..sprite = await loadSprite('girl.png')
      ..size = Vector2(100.0, 100.0)
      ..x = 150..y = 50;

    add(girl);
  }
}
