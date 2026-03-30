import 'package:flame/game.dart';
import 'package:flappy_bird/bootstrap.dart';
import 'package:flappy_bird/game/game.dart';

Future<void> main() async {
  await bootstrap(() {
    final flappyBird = FlappyBird();

    return GameWidget(
      game: flappyBird,
      initialActiveOverlays: const [GameRouter.mainMenuRoute],
      overlayBuilderMap: GameRouter.overlayBuilderMap(),
    );
  });
}
