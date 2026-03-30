import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/game/game.dart';

class PipeComponent extends SpriteComponent with HasGameReference<FlappyBird> {
  PipeComponent({required this.height, required this.pipePosition});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  FutureOr<void> onLoad() async {
    final pipe = await Flame.images.load(AssetsPath.pipeSprite);
    final pipeFlipped = await Flame.images.load(AssetsPath.pipeFlippedSprite);
    size = Vector2(50, height);

    switch (pipePosition) {
      case .top:
        position.y = 0;
        sprite = Sprite(pipeFlipped);
      case .bottom:
        position.y = game.size.y - size.y - GameValues.groundHeight;
        sprite = Sprite(pipe);
    }

    return super.onLoad();
  }
}
