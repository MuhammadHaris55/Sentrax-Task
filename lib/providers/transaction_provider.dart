import 'package:sentrax_project/models/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> list = [];

  void addTransaction(Transaction transaction) {
    list.add(transaction);
    notifyListeners();
  }

  void deleteTransaction(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
