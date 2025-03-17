import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/games.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {'/home': (context) => const HomePage()},
      onGenerateRoute: (settings) {
        if (settings.name == '/jogo') {
          final args = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) => JogoPage(
                  resultado: args['resultado'],
                  jogadaUsuario: args['jogadaUsuario'],
                  jogadaApp: args['jogadaApp'],
                ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return child;
            },
          );
        }
        return null;
      },
    );
  }
}
