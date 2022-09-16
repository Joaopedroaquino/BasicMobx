import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'store/counter_store.dart';

final counterStore = CounterStore();

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

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
