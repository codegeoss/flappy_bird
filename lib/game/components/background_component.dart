import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/game.dart';

class BackgroundComponent extends SpriteComponent
    with HasGameReference<FlappyBird> {
  BackgroundComponent();

  @override
  FutureOr<void> onLoad() async {
    final bg = await Flame.images.load(AssetsPath.backgroundSprite);
    size = game.size;
    sprite = Sprite(bg);
    return super.onLoad();
  }
}
