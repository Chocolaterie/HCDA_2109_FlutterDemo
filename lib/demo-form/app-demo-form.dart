import 'package:eni_demo/demo-form/eni-validator.dart';
import 'package:eni_demo/demo-stateful/counter-widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoFormApp());
}

class DemoFormWidget extends StatefulWidget {
  @override
  State<DemoFormWidget> createState() {
    return _DemoFormWidget();
  }
}

class _DemoFormWidget extends State<DemoFormWidget> {
  var _formKey = GlobalKey<FormState>();

  bool valueSwitch = true;

  void onSubmit() {
    // Enclancher la validation (return true si tout est ok)
    if (_formKey.currentState!.validate()) {
      print("C'est Nul");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Flex(
          direction: Axis.vertical,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Email"),
              validator: EniValidator.validationEmail,
            ),
            ElevatedButton(onPressed: onSubmit, child: Text("Submit"))
          ],
        ));
  }
}

class DemoFormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Stateful"),
        ),
        body: DemoFormWidget(),
      ),
    );
  }
}
