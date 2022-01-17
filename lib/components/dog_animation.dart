import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class DogAnimation extends SpriteAnimationComponent with HasHitboxes, Collidable {
  DogAnimation({
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size);

  DogAnimation.fromFrameData(
    ui.Image image,
    SpriteAnimationData data, {
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size) {
    animation = SpriteAnimation.fromFrameData(image, data);
    // debugMode = true;
    addHitbox(HitboxRectangle());
  }
}
