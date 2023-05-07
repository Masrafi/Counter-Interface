import 'package:counter/home_presenter.dart';
import 'package:counter/counter_interface.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements Interface {
  late HomePresenter homePresenter;
  ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    homePresenter = HomePresenter(this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, int value, Widget? child) {
                return Text('$value');
              },
              valueListenable: valueNotifier,
              child: null,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homePresenter.changeNumber(valueNotifier.value + 1),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }

  @override
  void updateNumber(int number) {
    // TODO: implement updateNumber
    valueNotifier.value = number;
  }
}
