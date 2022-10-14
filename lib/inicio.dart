import 'package:flutter/material.dart';
import 'package:flutter_project/drawer.dart';
import 'inicio.dart';
import 'cardapio.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'combosClassicos.dart';
import 'pages/to_do_list_page.dart';
import 'combosEspeciais.dart';
import 'drawer.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

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
      drawer: meuDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Inicio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        //   height: double.infinity,
        //  width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            //alignment: Alignment.center,
            image: AssetImage('assets/images/risa.png'),
            //fit: BoxFit.cover,
            //image: NetworkImage('link imagem web')
          ),
        ),
      ),
    );
  }
}
