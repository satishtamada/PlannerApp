import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        children: transaction.map((tx) {
          return Card(
              child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '\$${tx.amount}',
                    style: TextStyle(color: Colors.purple),
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title.toUpperCase(),
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        DateFormat().format(tx.dateTime),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                )
              ],
            ),
          ));
        }).toList(),
      ),
    );
  }
}
