import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> transaction;
  Function deleteTran;

  TransactionList(this.transaction, this.deleteTran);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: transaction.length != 0
            ? ListView.builder(
                itemCount: transaction.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text(
                            '\$${transaction[index].amount}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      title: Text(
                        transaction[index].title.toUpperCase(),
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      subtitle: Text(
                        DateFormat().format(transaction[index].dateTime),
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => deleteTran(transaction[index].id),
                      ),
                    ),
                  );
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
