import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/bgm.dart';
import 'package:flame_audio/flame_audio.dart';

import './components/cat.dart';
import './components/dog.dart';
import './components/platform.dart';

class MyGame extends FlameGame with DoubleTapDetector, HasCollidables {
  Cat cat = Cat();
  Dog dogAnimation = Dog();
  bool running = true;
  String direction = 'up';
  late Sprite platformSprite;
  double characterScale = 0.7;
  double speed = 2.0;
  double jumpHeight = 50.0;
  double rotateSpeed = 0.5;

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
    await super.onLoad();

    // FlameAudio.bgm.play('knight_online_soundtrack.mp3');

    SpriteComponent background = SpriteComponent()
      ..sprite = await loadSprite('background.png')
      ..size = size;
    add(background);

    platformSprite = await loadSprite('platform.png');
    initPlatform(platformSprite, size);

    cat
      ..sprite = await loadSprite('cat.png')
      ..position = Vector2(50, 400)
      ..size = Vector2(152.0 * characterScale, 152.0 * characterScale)
      ..anchor = Anchor.center;
    add(cat);

    var spriteSheet = await images.load('dog_jump_spritesheet.png');
    final spriteSize = Vector2(152 * characterScale, 142 * characterScale);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 8, stepTime: 0.05, textureSize: Vector2(160.0, 142.0));
    dogAnimation = dogAnimation = Dog.fromFrameData(spriteSheet, spriteData)
      ..x = 170
      ..y = 650
      ..size = spriteSize
      ..anchor = Anchor.center;
    add(dogAnimation);
  }

  @override
  void update(double dt) {
    super.update(dt);

    cat.angle += rotateSpeed * dt;
    cat.angle %= 2 * math.pi;

    switch (direction) {
      case 'up':
        dogAnimation.y += speed;
        break;
      case 'down':
        dogAnimation.y -= speed;
        break;
    }

    if (dogAnimation.y > size[1] - 30) {
      direction = 'down';
    }
    if (dogAnimation.y < 30) {
      direction = 'up';
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
