import 'package:eni_demo/demo-webservice/todo.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class DemoListViewPage extends StatefulWidget {
  @override
  State<DemoListViewPage> createState() {
    return _DemoListViewPageState();
  }
}

class _DemoListViewPageState extends State<DemoListViewPage> {

  // ma liste de todos
  var todos = [];
  ProgressDialog? pgDl;

  /**
   * Afficher une chargement
   */
  void showProgress(){
    ///= Create progress dialog
    pgDl = ProgressDialog(context: context);

    // Display progress
    pgDl!.show(
      msg: 'Récupération des Todos...',
      progressBgColor: Colors.transparent,
      elevation: 10.0,
      barrierColor: Color(0x77000000)
    );

  }

  void apiCall() async {
    // l'url de l'api
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/1/todos');

    // avant l'appel api j'affiche le chargement
    showProgress();

    // Simuler 3 secondes d'attente
    await Future.delayed(Duration(seconds: 3));

    // l'appel http en methode Get
    var response = await http.get(url);

    // Uniquement quand la réponse http est ok
    if (response.statusCode == 200) {
      // Notifier que la vue à changer/va changer
      setState(() {
        // Re Alimenter la liste des Todos
        todos = convert
            .jsonDecode(response.body)
            .map((data) => Todo.fromJson(data))
            .toList();

        // Je ferme le chargement car Traitement asynchrone
        pgDl!.close();
      });
    }
  }
  void clearList() {
    setState(() {
      todos = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Listview"),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      apiCall();
                    },
                    child: Text("Appeler API"))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      clearList();
                    },
                    child: Text("Clear"))),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 65,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Id : ${todos[index].id} - Title : ${todos[index].title}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

}
