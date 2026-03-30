import 'dart:async';

import 'package:flame/collisions.dart';
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
    add(
      RectangleHitbox(
        position: Vector2(0, game.size.y - GameValues.groundHeight),
        size: Vector2(game.size.x, GameValues.groundHeight),
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    parallax?.baseVelocity.x = GameValues.gameSpeed;
    super.update(dt);
  }
}
