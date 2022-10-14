import 'package:flutter/material.dart';
import 'drawer.dart';
import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'combosClassicos.dart';
import 'combosEspeciais.dart';

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
      drawer: meuDrawer(),
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
    );
  }
}
