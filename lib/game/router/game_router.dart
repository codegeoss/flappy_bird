import 'package:flame/game.dart';
import 'package:flappy_bird/features/features.dart';
import 'package:flappy_bird/game/game.dart';

abstract class GameRouter {
  static const String mainMenuRoute = '/main-menu-route';
  static const String gameOverRoute = '/game-over-route';

  static Map<String, OverlayWidgetBuilder<FlappyBird>>? overlayBuilderMap() {
    final map = <String, OverlayWidgetBuilder<FlappyBird>>{}
      ..addAll({
        mainMenuRoute: (context, game) => MenuScreen(flappyBird: game),
        gameOverRoute: (context, game) => GameOverScreen(flappyBird: game),
      });
    return map;
  }
}
