import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'api.dart';

void getHttp() async {
  try {
    var response = await Dio().get('http://localhost:3000/combos-classicos');
    //  await Dio().get('https://jsonplaceholder.typicode.com/todos/1');
    print(response);
  } catch (e) {
    print(e);
  }
}
//https://github.com/typicode/json-server  -- Usado para criar a API Local.

class Api extends StatelessWidget {
  const Api({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'APIs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                getHttp();
              },
              icon: Icon(Icons.add, size: 18),
              label: Text("Consultar Combos Simples"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Inicio"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Inicio(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.ballot_rounded),
              title: Text("Cardápio"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cardapio(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment_rounded),
              title: Text("Pedido"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => toDoListPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility_new_rounded),
              title: Text("Contagem de Clientes"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Contagem(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate_rounded),
              title: Text("Calculadora"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculadora(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.integration_instructions_rounded),
              title: Text("API's"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Api(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
