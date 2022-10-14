import 'package:flutter/material.dart';
import 'inicio.dart';
import 'cardapio.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'combosClassicos.dart';
import 'pages/to_do_list_page.dart';
import 'combosEspeciais.dart';
import 'drawer.dart';

class meuDrawer extends StatelessWidget {
  const meuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              leading: Icon(Icons.fastfood_rounded),
              title: Text("Combos-Clássicos"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => combosClassicos(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood_rounded),
              title: Text("Combos-Especiais"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => combosEspeciais(),
                ));
              },
            ),
          ],
        ),
      );
  }
}