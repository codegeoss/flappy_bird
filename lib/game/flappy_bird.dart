import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/game/game.dart';

class FlappyBird extends FlameGame {
  late BirdComponent bird;

  @override
  FutureOr<void> onLoad() async {
    await addAll([
      BackgroundComponent(),
      GroundComponent(),
      bird = BirdComponent(),
    ]);
    return super.onLoad();
  }
}
