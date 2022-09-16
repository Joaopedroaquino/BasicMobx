//constantes matematicas/funções/gerador de numeros aleatórios
import 'dart:math';

import 'package:mobx/mobx.dart';

part 'dice_counter.g.dart';

class DiceCounter = _DiceCounter with _$DiceCounter;

abstract class _DiceCounter with Store {
  //observa o dado da esquerda e iniciado com um valor aleatorio entre 1 e 6
  @observable
  int left = Random().nextInt(6) + 1;
//observa o dado da direira e iniciado com um valor aleatorio entre 1 e 6
  @observable
  int right = Random().nextInt(6) + 1;

//observavel computado que observa e acompanha o resultado dos dados sempre que a contagem e atualizada
  @computed
  int get total => left + right;

//atualiza a a contagem dos dados toda vez que o dado e clicado
  @action
  void roll() {
    left = Random().nextInt(6) + 1;
    right = Random().nextInt(6) + 1;
  }
}
