import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/game/game.dart';
import 'package:flutter/material.dart';

class FlappyBird extends FlameGame with TapCallbacks, HasCollisionDetection {
  late BirdComponent bird;
  late TextComponent scoreText;
  Timer interval = Timer(GameValues.pipeInterval, repeat: true);
  bool isPipeHit = false;

  @override
  FutureOr<void> onLoad() async {
    await addAll([
      BackgroundComponent(),
      GroundComponent(),
      bird = BirdComponent(),
      scoreText = highScore,
    ]);

    interval.onTick = () => add(PipeGroupComponent());
    return super.onLoad();
  }

  TextComponent get highScore {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: .topCenter,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontFamily: 'Flappy',
          fontWeight: .bold,
        ),
      ),
    );
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    await bird.onTapFly();
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    interval.update(dt);
    scoreText.text = 'Score: ${bird.score}';
    super.update(dt);
  }
}
