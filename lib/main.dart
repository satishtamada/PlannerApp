import 'package:flutter/material.dart';
import 'package:planner_app/model/transaction.dart';
import 'package:planner_app/widget/new_transaction_list.dart';
import 'package:planner_app/widget/transaction_list.dart';

void main() => runApp(HomeApp());

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Home(),
    );
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
    Transactions(
        title: 'milk packet', id: 't1', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'chicken', id: 't2', amount: 55.6, dateTime: DateTime.now()),
    Transactions(
        title: 'butter', id: 't3', amount: 55.6, dateTime: DateTime.now())
  ];

  void openAddNewTransactionBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransactionList(addTransaction),
            onTap: (){},
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
            Card(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text('Header Container')),
              elevation: 5,
            ),
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
