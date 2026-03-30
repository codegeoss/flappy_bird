import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/game/game.dart';

class FlappyBird extends FlameGame with TapCallbacks, HasCollisionDetection {
  late BirdComponent bird;
  Timer interval = Timer(GameValues.pipeInterval, repeat: true);
  bool isPipeHit = false;

  @override
  FutureOr<void> onLoad() async {
    await addAll([
      BackgroundComponent(),
      GroundComponent(),
      bird = BirdComponent(),
    ]);

    interval.onTick = () => add(PipeGroupComponent());
    return super.onLoad();
  }

  @override
  Future<void> onTapDown(TapDownEvent event) async {
    await bird.onTapFly();
    super.onTapDown(event);
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }
}
