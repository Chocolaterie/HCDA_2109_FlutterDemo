import 'package:eni_demo/demo-provider/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoProviderPage extends StatefulWidget {
  @override
  State<DemoProviderPage> createState() => _DemoProviderPageState();
}

class _DemoProviderPageState extends State<DemoProviderPage> {

  void testUpdatePseudo(BuildContext context) async {
    // Modifier une donnée dans le provider
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.updatePseudo("LucasKarenAnnestAminAxelNicolas");

    // Attendre 2 sec avant d'affiche la deuxieme page
    await Future.delayed(Duration(seconds: 2));

    // Naviguer sur la deuxieme page
    Navigator.pushNamed(context, "/two");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo Provider"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    testUpdatePseudo(context);
                  },
                  child: Text("Mettre à jour")),
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return Text('Bonjour ${value.pseudo}');
                },
              ),
            ],
          ),
        ));
  }
}
