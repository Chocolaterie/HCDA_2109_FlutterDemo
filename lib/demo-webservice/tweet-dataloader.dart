import 'dart:convert' as convert;
import 'package:eni_demo/demo-webservice/todo.dart';
import 'package:http/http.dart' as http;

class DataLoader {

  String url;

  DataLoader(this.url);

  Future<dynamic> getData() async {
    // l'url de l'api
    var url = Uri.parse(this.url);

    // Simuler 3 secondes d'attente
    await Future.delayed(Duration(seconds: 1));

    // l'appel http en methode Get
    var response = await http.get(url);

    // Uniquement quand la réponse http est ok
    if (response.statusCode == 200) {
      // Notifier que la vue à changer/va changer

      // Re Alimenter la liste des Todos
      return convert
          .jsonDecode(response.body)
          .map((data) => Todo.fromJson(data))
          .toList();

    }

    return [];
  }

}