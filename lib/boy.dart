import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class Boy extends SpriteComponent with HasHitboxes, Collidable {
  Boy({
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size) {
    // debugMode = true;
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> points, Collidable other) {
    super.onCollision(points, other);
    print('Collision!');
    // removeFromParent();
  }
}