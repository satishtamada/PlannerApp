import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/widget/new_transaction_list.dart';
import 'package:planner_app/model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:planner_app/widget/transaction_list.dart';
import 'package:planner_app/widget/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String inputTitle;
  String inputAmount;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Planner"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child:
                    Container(width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: Text('Header Container')),
                elevation: 5,
              ),
              UserTransaction()
            ],
          ),
        ),
      ),
    );
  }
}
