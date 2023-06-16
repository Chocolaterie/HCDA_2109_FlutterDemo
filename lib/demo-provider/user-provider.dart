import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {

  String pseudo = "anonymous";

  void updatePseudo(String newPseudo){

    pseudo = newPseudo;

    // notifier à tout les widgets qui sont abonnés au provider le changement
    notifyListeners();
  }
}