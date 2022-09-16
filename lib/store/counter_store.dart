import 'package:mobx/mobx.dart';

//Arquivo .g gerado pelo build runner
part 'counter_store.g.dart';

//Classe usada pela base de codigo
// O código gerado estará dentro do arquivo part: counter.g.dart, que incluímos com a partdiretiva .
//Sem isso, o build_runnernão produzirá qualquer saída.
// O arquivo gerado contém o _$CounterStoremixin.
class CounterStore = _CounterStoreBase with _$CounterStore;

//Classe da store
// A classe abstrata _CounterStore inclui o Storemixin.
//Todo o seu código relacionado à store deve ser colocado dentro dessa classe abstrata.
// Criamos uma classe Counter  para mesclar o código do build_runner.

abstract class _CounterStoreBase with Store {
  //Observa a variavel, caso tenha a mudanca de estado
  // anotação para marcar o value como observável.
  @observable
  int value = 0;

  //Acao usada para reconstruir o valor da variada qual o observable esta notificando
  //action para marcar o increment()método como uma ação.
  @action
  void increment() {
    value++;
  }
}

//flutter pub run build_runner build para gerar o arquivo .g
//em caso de conflitos com arquivos gerados usar flutter pub run build_runner build --delete-conflicting-outputs
//flutter pub run build_runner watch gera o arquivo .g sempre que for salvado