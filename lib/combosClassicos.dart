import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'combosClassicos.dart';
import 'combosEspeciais.dart';
import 'drawer.dart';

// void getComboClassicos() async {
//   try {
//     var response = await Dio().get('http://localhost:3000/combos-classicos');
//     print(response);
//   } catch (e) {
//     print(e);
//   }
// }

Future<List> getComboClassicos() async {
  var url = Uri.parse('http://localhost:3000/combos-classicos');
  var response = await http.get(url);
  return jsonDecode(utf8.decode(response.bodyBytes));
}

Future<List> getComboEspeciais() async {
  var url = Uri.parse('http://localhost:3000/combos-especiais');
  var response = await http.get(url);
  return jsonDecode(utf8.decode(response.bodyBytes));
}

//https://github.com/typicode/json-server  -- Usado para criar a API Local.
// json-server --watch db.json   --Inicia API Local.

class combosClassicos extends StatefulWidget {
  const combosClassicos({Key? key}) : super(key: key);

  @override
  State<combosClassicos> createState() => _combosClassicosState();
}

class _combosClassicosState extends State<combosClassicos> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Combos-Clássicos',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: FutureBuilder<List>(
          future: getComboClassicos(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar API'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      backgroundImage: AssetImage('assets/images/risa.png'),
                    ),
                    title: Text(snapshot.data![index]['nome']),
                    subtitle: Text(
                        'Lanche: ${snapshot.data![index]['lanche']} \nAcompanhamento: ${snapshot.data![index]['acompanhamento']} \nBebida: ${snapshot.data![index]['bebida']}'),
                    trailing: Text(snapshot.data![index]['valor']),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
