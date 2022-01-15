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
  SpriteComponent boy = SpriteComponent();
  SpriteAnimationComponent girlAnimation = SpriteAnimationComponent();
  bool running = true;
  String direction = 'down';
  double speed = 2.0;
  late Sprite platformSprite;

  @override
  Future<void> onLoad() async {
    print('loading....');

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('background.png')
      ..size = size;
    add(background);

    platformSprite = await loadSprite('platform.png');
    SpriteComponent platform = SpriteComponent()
      ..sprite = platformSprite
      ..size = Vector2(150, 35)
      ..x = 30
      ..y = 665;
    add(platform);

    boy
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(200.0, 200.0)
      ..x = 50
      ..y = 500;
    add(boy);

    var spriteSheet = await images.load('girl_spritesheet.png');
    final spriteSize = Vector2(152, 142);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 9, stepTime: 0.05, textureSize: Vector2(151.3, 142.0));
    girlAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteData)
          ..x = 170
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

    if (girlAnimation.y > 500) {
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
