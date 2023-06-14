import 'package:eni_demo/demo-route/first-page-demo.dart';
import 'package:eni_demo/demo-route/seconde-page-demo.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(DemoRouteApp());
}

class DemoRouteApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo Route",
      initialRoute: "/",
      routes: {
        "/" : (context) => FirstPageDemo(),
        "/second" : (context) => SecondPageDemo(),
      },
    );
  }

}