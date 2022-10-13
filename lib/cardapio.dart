import 'package:flutter/material.dart';

import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'api.dart';

class Cardapio extends StatelessWidget {
  const Cardapio({Key? key}) : super(key: key);

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
          'Cardápio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Teste',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Teste',
                        style: TextStyle(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Teste',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            'Teste',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '4',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '5',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '6',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '7',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '8',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '9',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  width: 50,
                  height: 50,
                ),
                Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Container(
                  color: Colors.black,
                  width: 50,
                  height: 50,
                ),
              ],
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
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/risa.png'),
                 // fit: BoxFit.cover,
                ),
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
