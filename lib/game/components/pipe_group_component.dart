import 'dart:async';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird/game/game.dart';

class PipeGroupComponent extends PositionComponent
    with HasGameReference<FlappyBird> {
  PipeGroupComponent();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = game.size.x;

    final heightMinusGround = game.size.y - GameValues.groundHeight;
    final spaceBtwnPipes = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spaceBtwnPipes +
        _random.nextDouble() * (heightMinusGround - spaceBtwnPipes);

    await addAll([
      PipeComponent(
        height: centerY - spaceBtwnPipes / 2,
        pipePosition: PipePosition.top,
      ),
      PipeComponent(
        height: heightMinusGround - (centerY + spaceBtwnPipes / 2),
        pipePosition: PipePosition.bottom,
      ),
    ]);
    return super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    position.x -= GameValues.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      await updateScore();
      log('pipe removed');
    }

    if (game.isPipeHit) {
      removeFromParent();
      game.isPipeHit = false;
    }
    super.update(dt);
  }

  Future<void> updateScore() async {
    game.bird.score += 1;
    await FlameAudio.play(AssetsPath.scoreAudio);
  }
}
