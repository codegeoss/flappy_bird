import 'package:flame/game.dart';
import 'package:flappy_bird/bootstrap.dart';
import 'package:flappy_bird/game/game.dart';

Future<void> main() async {
  await bootstrap(
    () => GameWidget(
      game: FlappyBird(),
    ),
  );
}
