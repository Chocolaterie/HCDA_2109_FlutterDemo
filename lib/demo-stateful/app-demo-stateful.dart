import 'package:flutter/material.dart';

void main() {
  runApp(DemoStatefulApp());
}

class DemoStatefulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Stateful"),
        ),
        body: Flex(direction: Axis.vertical,
            children: [
              Text("Hello")
            ]),
      ),
    );
  }
}
