import 'package:flutter/foundation.dart';

class Transactions {
  final String title;
  final String id;
  final double amount;
  final DateTime dateTime;

  Transactions(
      {@required this.title,
      @required this.id,
      @required this.amount,
      @required this.dateTime});
}
