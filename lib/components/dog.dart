import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';

class Dog extends SpriteComponent with Tappable {
  Dog({
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size) {}

  @override
  bool onTapDown(TapDownInfo info) {
    try {
      removeFromParent();
      return true;
    } catch (error) {
      return false;
    }
  }
}
