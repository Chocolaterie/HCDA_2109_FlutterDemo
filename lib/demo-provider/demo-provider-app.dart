import 'package:eni_demo/demo-provider/counter-provider.dart';
import 'package:eni_demo/demo-provider/demo-provider-page-2.dart';
import 'package:eni_demo/demo-provider/demo-provider-page.dart';
import 'package:eni_demo/demo-provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: DemoProviderApp(),
  ),);
}


class DemoProviderApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => DemoProviderPage(),
        "/two" : (context) => DemoProviderPageTwo(),
        }
      );
    }
}