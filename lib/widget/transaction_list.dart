import 'package:flutter/cupertino.dart';
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
        child: transaction.length != 0
            ? ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            '\$${transaction[index].amount}',
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
                                transaction[index].title.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              Text(
                                DateFormat()
                                    .format(transaction[index].dateTime),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                        )
                      ],
                    ),
                  ));
                },
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No data found..!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/cart.png',
                        width: 80,
                        height: 80,
                      ),
                    )
                  ],
                )));
  }
}
