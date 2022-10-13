import 'package:flutter/material.dart';

import 'inicio.dart';
import 'cardapio.dart';
import 'pages/to_do_list_page.dart';
import 'contagem.dart';
import 'calculadora.dart';
import 'api.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String enteredText = '';
  String operator = '';
  double result = 0;
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Calculadora',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      enteredText,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color.fromARGB(255, 37, 35, 35),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText = enteredText.substring(
                                    0, enteredText.length - 1);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              'AC',
                              style: TextStyle(
                                color: Color(0xff26F4CE),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (i == 1) {
                                operator = '-';
                                i++;
                                setState(() {
                                  enteredText += '-';
                                });
                              } else if (i == 2) {
                                operator = '+';
                                i--;
                                setState(() {
                                  enteredText += '+';
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '+/_',
                              style: TextStyle(
                                color: Color(0xff26F4CE),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              operator = '%';
                              setState(() {
                                enteredText += '%';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '%',
                              style: TextStyle(
                                color: Color(0xff26F4CE),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              operator = '/';
                              setState(() {
                                enteredText += '/';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '/',
                              style: TextStyle(
                                color: Color(0xffD76061),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '7';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '7',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '8';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '8',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '9';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '9',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              operator = '*';
                              setState(() {
                                enteredText += '*';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xffD76061),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '4';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '4',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '5';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '6';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '6',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              operator = '-';
                              setState(() {
                                enteredText += '-';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '-',
                              style: TextStyle(
                                color: Color(0xffD76061),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '1';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '2';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '3';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '3',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              operator = '+';
                              setState(() {
                                enteredText += '+';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '+',
                              style: TextStyle(
                                color: Color(0xffD76061),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText = '';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Icon(Icons.refresh),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '0';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '0',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                enteredText += '.';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '.',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              List myList = enteredText.split(operator);
                              double number1 = double.parse(myList[0]);
                              double number2 = double.parse(myList[1]);
                              //print(number1);
                              //print(number2);
                              //print(operator);
                              switch (operator) {
                                case '+':
                                  {
                                    result = number1 + number2;
                                    break;
                                  }
                                case '-':
                                  {
                                    result = number1 - number2;
                                    break;
                                  }
                                case '*':
                                  {
                                    result = number1 * number2;
                                    break;
                                  }
                                case '/':
                                  {
                                    result = number1 / number2;
                                    break;
                                  }
                                case '%':
                                  {
                                    result = number1 % number2;
                                    break;
                                  }
                              }
                              setState(() {
                                enteredText = result.toString();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff272B33),
                              fixedSize: const Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              '=',
                              style: TextStyle(
                                color: Color(0xffD76061),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
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
