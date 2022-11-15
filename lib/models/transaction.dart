import 'dart:convert';

import 'package:intl/intl.dart';

class Transaction {
// "2021-07-05T00:34:29.993Z",
//   "209.78",
// "withdrawal",
// "XBD",
// "IE53624A00844716683079",
// "payment transaction at Hilpert, Emard and Denesik using card ending with ***9524 for JPY 324.08 in account ***83781284",
// "JBFEMWP1745",
// "1",

  final String date;
  final String amount;
  final String type;
  final String currencyCode;
  final String iban;
  final String description;
  final String bic;
  final String id;

  Transaction({
    required this.date,
    required this.amount,
    required this.type,
    required this.currencyCode,
    required this.iban,
    required this.description,
    required this.bic,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'amount': amount,
      'type': type,
      'currencyCode': currencyCode,
      'iban': iban,
      'description': description,
      'bic': bic,
      'id': id,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      // date: map['date'] ?? '',
      date: map['date'] != null
          // ? DateTime.parse(map['date']).toIso8601String()
          ? '${DateFormat.M().format(DateTime.parse(map['date'])).toString()}-${DateFormat.MMM().format(DateTime.parse(map['date'])).toString()}-${DateFormat.yMMMEd().format(DateTime.parse(map['date'])).split(' ').last}'
          : '',
      amount: map['amount'] ?? '',
      type: map['type'] ?? '',
      currencyCode: map['currencyCode'] ?? '',
      iban: map['iban'] ?? '',
      description: map['description'] ?? '',
      bic: map['bic'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));
}
