import 'package:sentrax_project/models/transaction.dart';

class TransactionList {
  List<Transaction> _list = [];

  TransactionList(this._list);

  List get list => _list;
}
