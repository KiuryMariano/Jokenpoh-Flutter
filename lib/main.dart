import 'package:flutter/material.dart';
import 'telas/home_page.dart';
import 'telas/jogo_page.dart';

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
            transitionDuration: Duration.zero, // Duração zero
            reverseTransitionDuration:
                Duration.zero, // Também zera a animação de volta
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              // Retorna o próprio child sem nenhuma animação
              return child;
            },
          );
        }
        return null;
      },
    );
  }
}
