// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';

// import 'counter_store.dart';

// final counterStore = CounterStore();

// class FullnamePage extends StatelessWidget {
//   const FullnamePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('MobX docs '),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Observer(
//                   builder: (_) => TextFormField(
//                       onChanged: ((value) => counterStore.firstName))),
//               Observer(
//                   builder: (_) => TextFormField(
//                         onChanged: (value) => counterStore.lastName,
//                       )),
//               Observer(
//                   builder: (_) => Text('${counterStore.newName(newName)}')),
//               TextButton(onPressed: () {}, child: Text('Get fulname'))
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: counterStore.increment,
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ));
//   }
// }
