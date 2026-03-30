import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappy_bird/game/game.dart';
import 'package:flutter/animation.dart';

class BirdComponent extends SpriteGroupComponent<BirdMovement>
    with HasGameReference<FlappyBird>, CollisionCallbacks {
  BirdComponent();

  late final initialPosition = Vector2(50, game.size.y / 2 - size.y / 2);

  @override
  FutureOr<void> onLoad() async {
    final birdMidFlap = await game.loadSprite(AssetsPath.birdMidFlapSprite);
    final birdUpFlap = await game.loadSprite(AssetsPath.birdUpFlapSprite);
    final birdDownFlap = await game.loadSprite(AssetsPath.birdDownFlapSprite);

    size = Vector2(50, 40);
    position = initialPosition;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };
    current = BirdMovement.middle;

    add(CircleHitbox());

    return super.onLoad();
  }

  Future<void> onTapFly() async {
    await add(
      MoveByEffect(
        Vector2(0, GameValues.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = .down,
      ),
    );
    current = .up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  void gameOver() {
    game.overlays.add(GameRouter.gameOverRoute);
    game.pauseEngine();
  }

  void reset() => position = initialPosition;

  @override
  void update(double dt) {
    position.y += GameValues.birdVelocity * dt;
    super.update(dt);
  }
}
