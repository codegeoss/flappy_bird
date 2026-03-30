import 'package:flappy_bird/game/game.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({required this.flappyBird, super.key});
  final FlappyBird flappyBird;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    widget.flappyBird.pauseEngine();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.flappyBird.overlays.remove(GameRouter.mainMenuRoute);
          widget.flappyBird.resumeEngine();
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(AssetsPath.menuSprite),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(AssetsPath.messageSprite),
        ),
      ),
    );
  }
}
