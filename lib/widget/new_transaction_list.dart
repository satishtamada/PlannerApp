import 'package:flutter/material.dart';

class NewTransactionList extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Function addNewTranscation;

  NewTransactionList(this.addNewTranscation);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              child: Text(
                'Add Item',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                addNewTranscation(titleController.text, double.parse(amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
