import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class Girl extends SpriteAnimationComponent with HasHitboxes, Collidable {
  Girl({
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size);

  Girl.fromFrameData(
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
