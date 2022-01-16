import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

import './boy.dart';
import './girl.dart';
import './platform.dart';

void main() {
  print('main file');

  final myGame = MyGame();
  runApp(
    GameWidget(game: myGame),
  );
}

class MyGame extends FlameGame with DoubleTapDetector, HasCollidables {
  Boy boy = Boy();
  Girl girlAnimation = Girl();
  bool running = true;
  String direction = 'down';
  double speed = 2.0;
  late Sprite platformSprite;
  double characterScale = 0.7;

  void initPlatform(Sprite sprite, screenSize) {
    for (var i = 1; i < 9; ++i) {
      var x = 0.0;
      Anchor anchor = Anchor.centerLeft;

      if (i % 2 == 0) {
        x = 20;
        anchor = Anchor.centerLeft;
      } else {
        x = screenSize[0] - 20;
        anchor = Anchor.centerRight;
      }

      Platform platform = Platform(
          position: Vector2(x, (i * size[1] / 10.0) + 50),
          size: Vector2(150 * 0.8, 35 * 0.8))
        ..anchor = anchor
        ..sprite = platformSprite;
      add(platform);
    }
  }

  @override
  Future<void> onLoad() async {
    print('loading....');

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('background.png')
      ..size = size;
    add(background);

    platformSprite = await loadSprite('platform.png');
    initPlatform(platformSprite, size);
    // Platform platform =
    //     Platform(position: Vector2(200, 600), size: Vector2(150, 35))
    //       ..sprite = platformSprite;
    // add(platform);

    // Platform platform2 =
    //     Platform(position: Vector2(25, 400), size: Vector2(150, 35))
    //       ..sprite = platformSprite;
    // add(platform2);

    // Platform platform3 =
    //     Platform(position: Vector2(200, 200), size: Vector2(150, 35))
    //       ..sprite = platformSprite;
    // add(platform3);

    boy
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(152.0 * characterScale, 152.0 * characterScale)
      ..x = 50
      ..y = 500;
    add(boy);

    var spriteSheet = await images.load('girl_spritesheet.png');
    final spriteSize = Vector2(152 * characterScale, 142 * characterScale);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 9, stepTime: 0.05, textureSize: Vector2(151.3, 142.0));
    girlAnimation = girlAnimation = Girl.fromFrameData(spriteSheet, spriteData)
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
