import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _counter = 0;

  void increment(){

    _counter ++;

    // notifier à tout les widgets qui sont abonnés au provider le changement
    notifyListeners();
  }
}