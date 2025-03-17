import 'package:flutter/material.dart';

class JogoPage extends StatefulWidget {
  final String resultado;
  final String jogadaApp;
  final String jogadaUsuario;
  const JogoPage({
    super.key,
    required this.resultado,
    required this.jogadaApp,
    required this.jogadaUsuario,
  });

  @override
  State<JogoPage> createState() => _JogoPageState();
}

class _JogoPageState extends State<JogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove o botão de voltar
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/${widget.jogadaApp}.png"),
            ),
          ),
          const Text(
            'Jogada da Maquina',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Icon(Icons.sync_alt, size: 60),
          const SizedBox(height: 5),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/images/${widget.jogadaUsuario}.png"),
            ),
          ),
          const Text(
            'Sua Jogada',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Icon(Icons.drag_handle, size: 60),
          const SizedBox(height: 5),

          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              widget.resultado == 'ganhou'
                  ? "assets/images/vitoria.png"
                  : widget.resultado == 'perdeu'
                  ? "assets/images/derrota.png"
                  : "assets/images/empate.png",
            ),
          ),
          const SizedBox(height: 10), // Espaço entre imagem e texto
          Text(
            widget.resultado == 'ganhou'
                ? 'Você Ganhou!'
                : widget.resultado == 'perdeu'
                ? 'Você Perdeu!'
                : 'Empate!',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () => Navigator.pop(context),
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.keyboard_return_outlined,
              color: Colors.white,
            ),
            label: const Text(
              "Jogar Novamente",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
