import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagens = [
    "assets/images/papel.png",
    "assets/images/pedra.png",
    "assets/images/tesoura.png",
  ];
  int _indiceAtual = 0;

  int _vitorias = 0;
  int _derrotas = 0;
  int _empates = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _indiceAtual = (_indiceAtual + 1) % imagens.length;
      });
    });
  }

  void _escolherJogada(String jogada) {
    final List<String> opcoes = ["pedra", "papel", "tesoura"];
    final String jogadaMaquina = (opcoes..shuffle()).first;

    String resultado;
    if (jogada == jogadaMaquina) {
      resultado = "empate";
      _empates++;
    } else if ((jogada == "pedra" && jogadaMaquina == "tesoura") ||
        (jogada == "papel" && jogadaMaquina == "pedra") ||
        (jogada == "tesoura" && jogadaMaquina == "papel")) {
      resultado = "ganhou";
      _vitorias++;
    } else {
      resultado = "perdeu";
      _derrotas++;
    }

    Navigator.pushNamed(
      context,
      '/jogo',
      arguments: {
        'resultado': resultado,
        'jogadaUsuario': jogada,
        'jogadaApp': jogadaMaquina,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Placar:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Vitórias: $_vitorias  |  Derrotas: $_derrotas  |  Empates: $_empates',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          Column(
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(imagens[_indiceAtual]),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Escolha do APP!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Icon(Icons.sync_alt, size: 60),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _escolherJogada("pedra"),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/pedra.png"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _escolherJogada("papel"),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/papel.png"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _escolherJogada("tesoura"),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/images/tesoura.png"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Escolha sua jogada!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
