import 'dart:ui';

import 'package:mobx/mobx.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:validators2/validators.dart';

part 'form_store.g.dart';

class CustomColor extends Color {
  CustomColor(int value) : super(value);
}

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  CustomColor color = CustomColor(0);

//observa o campo username
  @observable
  String name = '';
//observa o campo email
  @observable
  String email = '';
//observa o campo senha
  @observable
  String password = '';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => usernameCheck.status == FutureStatus.pending;

  @computed
  bool get canLogin => !error.hasErrors;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

//retorna mensagem de erro caso o campo nome esteja vazio
//validacao assincrona
  @action
  Future validateUsername(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Nao pode ser vazio';
      return;
    }

    try {
      usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await usernameCheck;
      if (!isValid) {
        error.username = 'O Nome do usuario nao pode ser admin';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

//retorna mensagem de erro caso o campo senha esteja vazio
  @action
  void validatePassword(String value) {
    error.password =
        isNull(value) || value.isEmpty ? 'Nao pode ser vazio' : null;
  }

//retorna mensagem de erro caso o campo email esteja invalido
  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Insira um email valido';
  }

  ///validacao do username
  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

//dispose = destroy
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

//funcao chamada no botao que valida os campos
  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  //observa o campo username
  @observable
  String? username;

  //observa o campo email
  @observable
  String? email;

  //observa o campo password
  @observable
  String? password;

  //observa o campo username
  @computed
  bool get hasErrors => username != null || email != null || password != null;
}
