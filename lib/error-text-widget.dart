import 'package:flutter/material.dart';

const errorTextStyle = TextStyle(color: Colors.red, fontSize: 60.0);

class ErrorTextWidget extends StatelessWidget {

  String? label;

  ErrorTextWidget({this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
    child:  Text(this.label!, style: errorTextStyle));
  }

}