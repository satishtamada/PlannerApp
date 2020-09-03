import 'package:flutter/material.dart';
import 'package:planner_app/model/transaction.dart';
import 'package:planner_app/widget/chart.dart';
import 'package:planner_app/widget/new_transaction_list.dart';
import 'package:planner_app/widget/transaction_list.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: Home(),
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amber,
            fontFamily: 'Quicksand'));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyDashBoard();
}

class MyDashBoard extends State<Home> {
  String inputTitle;
  String inputAmount;

  List<Transactions> transaction = [
    /* Transactions(
        title: 'milk packet', id: 't1', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'chicken', id: 't2', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'butter', id: 't3', amount: 55.6, dateTime: DateTime.now())*/
  ];

  void openAddNewTransactionBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransactionList(addTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

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

  List<Transactions> get _recentTransaction {
    return transaction.where((tx) {
      return tx.dateTime.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => openAddNewTransactionBottomSheet(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(transaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => openAddNewTransactionBottomSheet(context),
      ),
    );
  }
}
