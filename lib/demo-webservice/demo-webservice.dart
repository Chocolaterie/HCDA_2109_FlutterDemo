import 'package:eni_demo/demo-webservice/demo-listview-page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(DemoWebserviceApp());
}

class DemoWebserviceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoListViewPage(),
    );
  }

}