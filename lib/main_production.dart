import 'package:flappy_bird/app/app.dart';
import 'package:flappy_bird/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
