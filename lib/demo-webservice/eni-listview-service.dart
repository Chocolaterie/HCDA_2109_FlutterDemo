// dart code file
import 'package:eni_demo/demo-webservice/todo.dart';
import 'package:eni_demo/demo-webservice/tweet-dataloader.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class EniListviewService<T> {
  State<StatefulWidget>? _state;
  DataLoader dataLoader;
  ProgressDialog? pgDl;
  var datas = [];

  EniListviewService(this.dataLoader);

  void setState(State<StatefulWidget> state) {
    this._state = state;
  }

  void perform(BuildContext context, Function() onFinish) async {
    showProgress(context);

    // dataloader
    var datas = await this.dataLoader.getData();

    pgDl!.close();

    // Notfy update
    _state!.setState(() {
      // callback for set state
      onFinish();
    });
  }

  /**
   * Afficher une chargement
   */
  void showProgress(BuildContext context) async {
    ///= Create progress dialog
    pgDl = ProgressDialog(context: context);

    // Simuler 1 secondes d'attente
    await Future.delayed(Duration(seconds: 1));

    // Display progress
    pgDl!.show(
        msg: 'Récupération des Todos...',
        progressBgColor: Colors.transparent,
        elevation: 10.0,
        barrierColor: Color(0x77000000));
  }

  Widget render(BuildContext context) {
    return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 65,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Id : ${datas[index].id} - Title : ${datas[index].title}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
