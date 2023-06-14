import 'package:flutter/material.dart';

class SecondPageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deuxieme page"),),
      body: Center(
        child: Text("Vous êtes sur la deuxieme page"),
      ),
    );
  }

}