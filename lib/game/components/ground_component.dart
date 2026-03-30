import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird/game/game.dart';

class GroundComponent extends ParallaxComponent<FlappyBird> {
  GroundComponent();

  @override
  FutureOr<void> onLoad() async {
    final ground = await Flame.images.load(AssetsPath.groundSprite);
    parallax = Parallax(
      [
        ParallaxLayer(
          ParallaxImage(ground, fill: .none),
        ),
      ],
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = GameValues.gameSpeed;
    super.update(dt);
  }
}
