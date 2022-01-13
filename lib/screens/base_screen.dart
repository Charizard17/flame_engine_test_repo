import 'dart:ui';

import 'package:flame/input.dart';

abstract class BaseScreen {
  void render(Canvas canvas);
  void update();
  void resize(Size size);
  void onTapDown(TapDownInfo details);
}
