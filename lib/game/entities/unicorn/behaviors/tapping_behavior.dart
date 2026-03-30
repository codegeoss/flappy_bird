import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:flappy_bird/game/game.dart';

class TappingBehavior extends Behavior<Unicorn>
    with TapCallbacks, HasGameReference<FlappyBird> {
  @override
  bool containsLocalPoint(Vector2 point) {
    return parent.containsLocalPoint(point);
  }

  // @override
  // Future<void> onTapDown(TapDownEvent event) async {
  //   if (parent.isAnimationPlaying()) {
  //     return;
  //   }
  //   game.counter++;
  //   parent.playAnimation();
  //
  //   await game.effectPlayer.play(AssetSource(Assets.audio.effect));
  // }
}
