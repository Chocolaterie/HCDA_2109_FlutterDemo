import 'package:flutter/material.dart';

class FirstPageDemo extends StatelessWidget {

  void openSecondPage(BuildContext context){
    Navigator.pushNamed(context, "/second");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Premiere page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Vous êtes sur la premiere page"),
            ElevatedButton(onPressed: () { openSecondPage(context); }, child: Text("Ouvrir la deuxieme page"))
          ],
        ),
      ),
    );
  }

}