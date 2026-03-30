import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/game/game.dart';
import 'package:flutter/animation.dart';

class BirdComponent extends SpriteGroupComponent<BirdMovement>
    with HasGameReference<FlappyBird>, CollisionCallbacks {
  BirdComponent();
  int score = 0;

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
    await FlameAudio.play(AssetsPath.flapAudio);
  }

  @override
  Future<void> onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) async {
    await gameOver();
    super.onCollisionStart(intersectionPoints, other);
  }

  Future<void> gameOver() async {
    await FlameAudio.play(AssetsPath.collisionAudio);
    game.overlays.add(GameRouter.gameOverRoute);
    game
      ..pauseEngine()
      ..isPipeHit = true;
  }

  void reset() {
    position = initialPosition;
    score = 0;
  }

  @override
  void update(double dt) {
    position.y += GameValues.birdVelocity * dt;
    super.update(dt);
  }
}
