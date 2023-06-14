import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {

  /*
    * Le compteur
   */
  int counter = 0;

  void increment(){
    // Ceci ne marche pas
    //counter++;
    // Marche : Notifier qu'il faut rafraichir le state et j'en profite pour incrementer le compteur
    setState(() {
      counter++;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(10),
            child: Text("Counter : ${this.counter}")
        ),
        ElevatedButton(onPressed: () { increment(); }, child: Text("Incrementer"))
      ],
    );
  }
}
