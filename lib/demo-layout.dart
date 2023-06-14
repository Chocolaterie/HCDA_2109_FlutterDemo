import 'package:flutter/material.dart';
import 'error-text-widget.dart';

void main() {
  runApp(DemoLayoutApp());
}

class DemoLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         title: Text("Title"),
        ),
        body: Flex(direction: Axis.vertical,
        children: [
          Text("Text", style: TextStyle(color: Color(0x005B0BF0), fontSize: 40),),
          Image.network("https://images.hindustantimes.com/img/2021/11/03/1600x900/Doge_meme_dog_birthday_1635925455510_1635925462309.PNG"),
          Image.asset("img/hugo_rouff.jpg"),// @Copyright Hugo Rouff
          // @Copyright Edouard (lequel?)
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                'img/hugo_rouff.jpg',
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
