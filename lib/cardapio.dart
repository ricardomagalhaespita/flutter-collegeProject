import 'package:flutter/material.dart';
import 'drawer.dart';
import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'combosClassicos.dart';
import 'combosEspeciais.dart';

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
      drawer: meuDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Cardápio',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/cardapio1.png'),
            Image.asset('assets/images/cardapio2.png'),
          ],
        ),
      ),
    );
  }
}
