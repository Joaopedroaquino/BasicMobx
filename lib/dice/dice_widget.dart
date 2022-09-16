import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/dice_counter.dart';

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //da acesso ao store do Mobx
    final diceCounter = DiceCounter();

    return Scaffold(
      backgroundColor: Colors.black,
      body: DiceScreen(),
    );
  }
}

class DiceScreen extends StatelessWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diceCounter = DiceCounter();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: diceCounter.roll,
                  //observer do dado esquerdo
                  child: Observer(
                    builder: (_) =>
                        Image.asset('images/dice${diceCounter.left}.png'),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: diceCounter.roll,
                  child: Observer(
                    //observer do dado direito
                    builder: (_) =>
                        Image.asset('images/dice${diceCounter.right}.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Observer(
              //observer do computed mostra a soma do resultado dos dois dados na tela
              builder: (_) => Text(
                'Valor Total: ${diceCounter.total}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
