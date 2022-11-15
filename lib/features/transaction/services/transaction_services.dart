// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constant/global_variables.dart';
import '../../../constant/utils.dart';
import '../../../models/transaction.dart';
import '../../../providers/transaction_provider.dart';

class TransactionServices {
  void getTransactions(BuildContext context) async {
    try {
      http.Response res = await http.get(
        Uri.parse(
          AppApis.getTransactions,
        ),
      );

      var transactions =
          Provider.of<TransactionProvider>(context, listen: false);

      for (var i = 0; i < res.body.length; i++) {
        transactions.addTransaction(
            Transaction.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        debugPrint('looping');
      }
    } catch (e) {
      debugPrint('Error ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }
}
