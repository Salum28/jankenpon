import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  // Atributos
  AssetImage _appChoice = const AssetImage('images/padrao.png');
  String _message = 'Escolha uma opção!';

  // Métodos
  _selectedOption(String usersChoice) {
    List<String> options = ['rock', 'paper', 'scissor'];
    int number = Random().nextInt(options.length);
    String appsChoice = options[number];

    switch(appsChoice) {
      case 'rock':
        setState(() {
          _appChoice = const AssetImage('images/pedra.png');
        });
        break;
      case 'paper':
        setState(() {
          _appChoice = const AssetImage('images/papel.png');
        });
        break;
      case 'scissor':
        setState(() {
          _appChoice = const AssetImage('images/tesoura.png');
        });
        break;
    }

    if(
      (usersChoice == 'rock' && appsChoice == 'scissor') ||
      (usersChoice == 'paper' && appsChoice == 'rock') ||
      (usersChoice == 'scissor' && appsChoice == 'paper')
    ) {
      setState(() {
        _message = 'Você venceu :)';
      });
    } else if(
      (appsChoice == 'rock' && usersChoice == 'scissor') ||
      (appsChoice == 'paper' && usersChoice == 'rock') ||
      (appsChoice == 'scissor' && usersChoice == 'paper')
    ) {
      setState(() {
        _message = 'Você perdeu :(';
      });
    } else {
      setState(() {
        _message = 'Empatamos :|';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JanKenPon'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Image(
            image: _appChoice,
            width: 120,
          ),
          Padding(
              padding: const EdgeInsets.all(20),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selectedOption('rock'),
                child: Image.asset('images/pedra.png', width: 120)
              ),
              GestureDetector(
                onTap: () => _selectedOption('paper'),
                child: Image.asset('images/papel.png', width: 120)
              ),
              GestureDetector(
                onTap: () => _selectedOption('scissor'),
                child: Image.asset('images/tesoura.png', width: 120)
              ),
            ],
          )
        ],
      ),
    );
  }
}
