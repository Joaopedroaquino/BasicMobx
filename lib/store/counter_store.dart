import 'package:mobx/mobx.dart';

//Arquivo .g gerado pelo build runner
part 'counter_store.g.dart';

//Classe usada pela base de codigo
class CounterStore = _CounterStoreBase with _$CounterStore;

//Classe da store
abstract class _CounterStoreBase with Store {
  //Observa a variavel, caso tenha a mudanca de estado
  @observable
  int value = 0;

  //Acao usada para reconstruir o valor da variada qual o observable esta notificando
  @action
  void increment() {
    value++;
  }
}


//flutter pub run build_runner build para gerar o arquivo .g 
