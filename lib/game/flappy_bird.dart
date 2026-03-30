import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/game/game.dart';

class FlappyBird extends FlameGame {
  late BirdComponent bird;
  Timer interval = Timer(GameValues.pipeInterval, repeat: true);

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
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }
}
