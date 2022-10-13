import 'package:flutter/material.dart';

import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'api.dart';

class Contagem extends StatefulWidget {
  const Contagem({super.key});

  @override
  State<Contagem> createState() => ContagemState();
}

class ContagemState extends State<Contagem> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
      print(count);
    });
  }

  void increment() {
    setState(() {
      count++;
      print(count);
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Contagem de Clientes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
         decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/wallpaper.jpg'),
             fit: BoxFit.cover,
             //image: NetworkImage('link imagem web')
           ),
         ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            isFull ? 'Lotado!' : 'Pode entrar!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 100,
              color: isFull ? Colors.red : Colors.black,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
                style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Color.fromARGB(255, 119, 118, 118).withOpacity(0.1)
                        : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                    //padding: const EdgeInsets.all(32),
                    ),
                child: const Text(
                  'Saiu!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              TextButton(
                onPressed: isFull ? null : increment,
                style: TextButton.styleFrom(
                    backgroundColor: isFull
                        ? Color.fromARGB(255, 119, 118, 118).withOpacity(0.1)
                        : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                    //padding: const EdgeInsets.all(32),
                    ),
                child: const Text(
                  'Entrou!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ]),
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
