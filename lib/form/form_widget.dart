import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/form_store.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  //acesso ao store
  final FormStore store = FormStore();

  @override
  void initState() {
    super.initState();
  }

//libera memoria alocada para variaveis quando o objeto de estado e removido(destroy)
  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Form(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            children: <Widget>[
              //obsever do campo nome
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.name = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                      hintText: 'Insira o nome',
                      errorText: store.error.username),
                ),
              ),
              SizedBox(height: 20),

              ///animacao de progress indicator para avalidacao do campo nome
              Observer(
                  builder: (_) => AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: store.isUserCheckPending ? 1 : 0,
                      child: const LinearProgressIndicator())),

              //observer do campo de email
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.email = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Insira o Email',
                      errorText: store.error.email),
                ),
              ),
              SizedBox(height: 20),
              //obsever do campo de senha
              Observer(
                builder: (_) => TextField(
                  obscureText: true,
                  onChanged: (value) => store.password = value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      icon: Icon(Icons.password_outlined),
                      labelText: 'Senha',
                      hintText: 'Insira a senha',
                      errorText: store.error.password),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: store.validateAll,
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ));
}
