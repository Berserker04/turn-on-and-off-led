import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Desconectado", //Conectado
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            disabledColor: Colors.grey,
            onPressed: () => null,
            icon: const Icon(Icons.power_settings_new),
            color: Colors.grey,
            iconSize: 40,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text("Contador"), Text('$counter')],
        ),
      ),
      floatingActionButton: CustomFloatingActions(
        increaseFn: () => setState(() => counter++),
        decreaseFn: () => setState(() => counter > 0 ? counter-- : 0),
        resetFn: () => setState(() => counter = 0),
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final increaseFn;
  final decreaseFn;
  final resetFn;

  const CustomFloatingActions({
    super.key,
    this.increaseFn,
    this.decreaseFn,
    this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      FloatingActionButton(
        onPressed: () => decreaseFn(),
        child: const Icon(Icons.exposure_minus_1),
      ),
      FloatingActionButton(
        onPressed: () => resetFn(),
        child: const Icon(Icons.restart_alt),
      ),
      FloatingActionButton(
        onPressed: () => increaseFn(),
        child: const Icon(Icons.exposure_plus_1),
      )
    ]);
  }
}
