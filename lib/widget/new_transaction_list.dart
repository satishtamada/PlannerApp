import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionList extends StatefulWidget {
  Function addNewTranscation;

  NewTransactionList(this.addNewTranscation);

  @override
  State<StatefulWidget> createState() => NewTranscation();
}

class NewTranscation extends State<NewTransactionList> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate;

  void addTranscation() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount < 0 || selectedDate == null) {
      return;
    }
    widget.addNewTranscation(title, amount, selectedDate);
    Navigator.of(context).pop();
  }

  void selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((onValue) {
      if (onValue == null) {
        return;
      }
      setState(() {
        selectedDate = onValue;
      });
    });
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
          Container(
            child: Row(
              children: <Widget>[
                Text(selectedDate == null
                    ? 'Select Date'
                    : DateFormat.yMd().format(selectedDate)),
                FlatButton(
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    selectDate();
                  },
                )
              ],
            ),
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Add Item',
              style: TextStyle(color: Colors.white),
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
