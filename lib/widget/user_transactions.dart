import 'package:flutter/material.dart';
import 'package:planner_app/widget/new_transaction_list.dart';
import 'package:planner_app/widget/transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserTransactions();
}

class UserTransactions extends State<UserTransaction> {
  List<Transactions> transaction = [
    Transactions(
        title: 'milk packet', id: 't1', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'chicken', id: 't2', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'butter', id: 't3', amount: 55.6, dateTime: DateTime.now())
  ];

  void addTransaction(String txtTitle, double txtAmount) {
    final newTx = Transactions(
        title: txtTitle,
        id: new DateTime.now().toString(),
        amount: txtAmount,
        dateTime: new DateTime.now());

    setState(() {
      transaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        NewTransactionList(addTransaction),
        TransactionList(transaction),
      ],
    );
  }
}
