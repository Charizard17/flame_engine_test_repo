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
  SpriteAnimationComponent girlAnimation = SpriteAnimationComponent();
  double speed = 2.0;

  @override
  Future<void> onLoad() async {
    print('loading....');
    girl
      ..sprite = await loadSprite('girl.png')
      ..size = Vector2(100.0, 100.0)
      ..x = 150
      ..y = 50;
    // add(girl);

    var spriteSheet = await images.load('girl_spritesheet.png');
    final spriteSize = Vector2(152 * 1.4, 142 * 1.4);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 9, stepTime: 0.05, textureSize: Vector2(151.3, 142.0));
    girlAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 100
          ..y = 50
          ..size = spriteSize;
    add(girlAnimation);
  }

  @override
  void update(double dt) {
    super.update(dt);

    switch (direction) {
      case 'down':
        girlAnimation.y += speed;
        break;
      case 'up':
        girlAnimation.y -= speed;
        break;
    }

    if (girlAnimation.y > 400) {
      direction = 'up';
    }
    if (girlAnimation.y < 20) {
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
