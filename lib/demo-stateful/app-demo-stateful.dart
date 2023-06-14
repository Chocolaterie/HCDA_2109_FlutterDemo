import 'package:eni_demo/demo-stateful/counter-widget.dart';
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
        body: Center(
          child: Flex(direction: Axis.vertical,
              children: [
                Text("Hello"),
                CounterWidget()
              ]),
        ),
      ),
    );
  }
}
