import 'package:flappy_bird/game/game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({required this.flappyBird, super.key});
  final FlappyBird flappyBird;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(AssetsPath.gameOverSprite),
            SizedBox(
              height: size.height * 0.025,
            ),
            ElevatedButton(
              onPressed: () {
                flappyBird.bird.reset();
                flappyBird.overlays.remove(GameRouter.gameOverRoute);
                flappyBird.resumeEngine();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Restart'.toUpperCase(),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
