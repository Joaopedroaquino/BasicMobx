import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starting_mobx/store/counter_store.dart';

final counterStore = CounterStore();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx Docs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MobX docs '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Voce apertou no botão'),
              Observer(
                  builder: (_) => Text(
                        '${counterStore.value}',
                        style: Theme.of(context).textTheme.headline6,
                      )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterStore.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
