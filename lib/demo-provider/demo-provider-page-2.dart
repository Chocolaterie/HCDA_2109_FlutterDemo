import 'package:eni_demo/demo-provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderPageTwo extends StatefulWidget {
  @override
  State<DemoProviderPageTwo> createState() => _DemoProviderPageTwoState();
}

class _DemoProviderPageTwoState extends State<DemoProviderPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider Page 2 "),
        ),
        body: Center(
          child: Column(
            children: [
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return Text('Bonjour ${value.pseudo}', style: TextStyle(fontSize: 30, color: Colors.red),);
                },
              ),
            ],
          ),
        ));
  }
}
