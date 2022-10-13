import 'package:flutter/material.dart';
import 'package:flutter_project/models/todo.dart';
//import 'package:flutter-collegeProject/repositories/todo_repository.dart';
import 'package:flutter_project/repositories/todo_repository.dart';
import '../widgets/todo_list_item.dart';
import '../inicio.dart';
import '../cardapio.dart';
import '../contagem.dart';
import '../calculadora.dart';
import '../api.dart';
import '../pages/to_do_list_page.dart';

class toDoListPage extends StatefulWidget {
  toDoListPage({super.key});

  @override
  State<toDoListPage> createState() => _toDoListPageState();
}

class _toDoListPageState extends State<toDoListPage> {
  final TextEditingController toDoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  //List<String> toDos = [];
  List<Todo> toDos = [];
  Todo? deletedToDo; //guardando o item deletado
  int? deletedToDoPos; //posição do item deletado
  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        toDos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: const Text(
          'Pedido',
          style: TextStyle(color: Colors.white),
        ),
      ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    //flex: 2,
                    child: TextField(
                      controller: toDoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione um Pedido',
                        hintText: 'Ex: X-Salada, sem salada',
                        errorText: errorText,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      String text = toDoController.text;
                      if (text.isEmpty) {
                        errorText = 'O pedido não pode ser vazio!';
                        return;
                      }
                      setState(() {
                        Todo newTodo = Todo(
                          title: text,
                          dateTime: DateTime.now(),
                        );
                        toDos.add(newTodo);
                        errorText = null;
                      });
                      toDoController.clear();
                      todoRepository.saveTodoList(toDos);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Todo toDo in toDos)
                      TodoListItem(
                        toDo: toDo,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui ${toDos.length} pedidos feitos',
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: showDeletetoDosConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text('Limpar Pedidos'),
                  )
                ],
              )
            ],
          ),
        )),
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
      ),
    );
  }

  void onDelete(Todo toDo) {
    deletedToDo = toDo;
    deletedToDoPos = toDos.indexOf(toDo);
    setState(() {
      toDos.remove(toDo);
    });
    todoRepository.saveTodoList(toDos);
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //impede a exibição de varios Snackbars um em cima do outro
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'O Pedido ${toDo.title} foi deletado com sucesso!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Color.fromARGB(255, 255, 1, 1),
          onPressed: () {
            setState(() {
              toDos.insert(deletedToDoPos!, deletedToDo!);
            });
            todoRepository.saveTodoList(toDos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeletetoDosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Deletar Tudo?'),
        content: Text('Você tem certeza que deseja deletar todos os Pedidos?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
            style: TextButton.styleFrom(
              primary: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAlltoDos();
            },
            child: Text('Deletar Tudo'),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void deleteAlltoDos() {
    setState(() {
      toDos.clear();
    });
    todoRepository.saveTodoList(toDos);
  }
}
