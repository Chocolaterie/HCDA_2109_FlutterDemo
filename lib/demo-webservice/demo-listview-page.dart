import 'package:eni_demo/demo-webservice/eni-listview-service.dart';
import 'package:eni_demo/demo-webservice/todo.dart';
import 'package:eni_demo/demo-webservice/tweet-dataloader.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class DemoListViewPage extends StatefulWidget {
  @override
  State<DemoListViewPage> createState() {
    return _DemoListViewPageState();
  }
}

class _DemoListViewPageState extends State<DemoListViewPage> {

  EniListviewService listviewService = EniListviewService<Todo>(DataLoader('https://jsonplaceholder.typicode.com/users/1/todos'));
  var todos = [];
  ProgressDialog? pgDl;

  @override
  void initState() {
    super.initState();

    listviewService.setState(this);
  }

  void apiCall() async {

    listviewService.perform(context, () {
      print("ok");
    });
  }

  void clearList() {
    setState(() {
      todos = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Listview"),
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      apiCall();
                    },
                    child: Text("Appeler API"))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      clearList();
                    },
                    child: Text("Clear"))),
          ),
          Expanded(
            child: listviewService.render(context),
          ),
        ],
      ),
    );
  }

}
