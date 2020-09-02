import 'package:flutter/material.dart';

class NewTransactionList extends StatefulWidget {
  Function addNewTranscation;

  NewTransactionList(this.addNewTranscation);

  @override
  State<StatefulWidget> createState() => NewTranscation();
}

class NewTranscation extends State<NewTransactionList> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addTranscation() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount < 0) {
      return;
    }
    widget.addNewTranscation(title,amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            keyboardType: TextInputType.number,
          ),
          FlatButton(
            child: Text(
              'Add Item',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: () {
              addTranscation();
            },
          ),
        ],
      ),
    );
  }
}
