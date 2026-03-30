import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/game/game.dart';

class BirdComponent extends SpriteGroupComponent<BirdMovement>
    with HasGameReference<FlappyBird> {
  BirdComponent();

  @override
  FutureOr<void> onLoad() async {
    final birdMidFlap = await game.loadSprite(AssetsPath.birdMidFlapSprite);
    final birdUpFlap = await game.loadSprite(AssetsPath.birdUpFlapSprite);
    final birdDownFlap = await game.loadSprite(AssetsPath.birdDownFlapSprite);

    size = Vector2(50, 40);
    position = Vector2(50, game.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };
    current = BirdMovement.middle;

    return super.onLoad();
  }
}
