import 'package:flutter/material.dart';

const List<String> list = <String>['Selecionar', 'Two', 'Three', 'Four'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, backgroundColor: Colors.white));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Dispositivo'),
                    DropdownButtonExample()
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  disabledColor: Colors.grey,
                  onPressed: () => null,
                  icon: const Icon(Icons.refresh),
                  color: Colors.grey,
                  iconSize: 40,
                )
              ],
            ),
            // SizedBox(
            //   height: 20,
            // ),
            const Image(image: AssetImage('assets/on.png'), height: 150),
            Column(
              children: [
                const Text(
                  'Apagar',
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                  onPressed: () => null,
                  icon: const Icon(Icons.power_settings_new),
                  color: Colors.redAccent,
                  iconSize: 80,
                )
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {},
              child: const Text(
                'Parpadear',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
