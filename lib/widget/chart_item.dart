import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  String label;
  double spendingAmount;
  double totalSpendingAmount;

  ChartItem(this.label, this.spendingAmount, this.totalSpendingAmount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: <Widget>[
          FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
          SizedBox(height: 4),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                ),
                FractionallySizedBox(
                  heightFactor:
                      totalSpendingAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
            width: 10,
            height: 60,
          ),
          SizedBox(height: 4),
          Text(label)
        ],
      ),
    );
  }
}
