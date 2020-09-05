import 'package:flutter/material.dart';
import 'package:planner_app/model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:planner_app/widget/chart_item.dart';

class Chart extends StatelessWidget {
  List<Transactions> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupTrnas {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dateTime.day == weekDay.day &&
            recentTransaction[i].dateTime.month == weekDay.month &&
            recentTransaction[i].dateTime.year == weekDay.year) {
          totalSum = totalSum + recentTransaction[i].amount;
        }
      }
      print(totalSum);
      print(DateFormat.E().format(weekDay));
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSum {
    return groupTrnas.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTrnas);
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupTrnas.map((data) {
          return Flexible(
              fit: FlexFit.tight,
              child: ChartItem(
                  data['day'],
                  data['amount'],
                  totalSum == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSum));
        }).toList(),
      ),
    );
  }
}
