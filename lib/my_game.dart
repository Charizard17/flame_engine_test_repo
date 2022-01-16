import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'components/cat.dart';
import 'components/dog.dart';
import 'components/platform.dart';

class MyGame extends FlameGame with DoubleTapDetector, HasCollidables {
  Cat cat = Cat();
  Dog dogAnimation = Dog();
  bool running = true;
  String direction = 'right';
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

    cat
      ..sprite = await loadSprite('cat.png')
      ..size = Vector2(152.0 * characterScale, 152.0 * characterScale)
      ..x = 50
      ..y = 500;
    add(cat);

    var spriteSheet = await images.load('dog_spritesheet.png');
    final spriteSize = Vector2(152 * characterScale, 142 * characterScale);
    SpriteAnimationData spriteData = SpriteAnimationData.sequenced(
        amount: 8, stepTime: 0.05, textureSize: Vector2(161.5, 142.0));
    dogAnimation = dogAnimation = Dog.fromFrameData(spriteSheet, spriteData)
      ..x = 170
      ..y = 250
      ..size = spriteSize;
    add(dogAnimation);
  }

  @override
  void update(double dt) {
    super.update(dt);

    switch (direction) {
      case 'right':
        dogAnimation.x += speed;
        break;
      case 'left':
        dogAnimation.x -= speed;
        break;
    }

    if (dogAnimation.x > 280) {
      direction = 'left';
    }
    if (dogAnimation.x < 5) {
      direction = 'right';
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
