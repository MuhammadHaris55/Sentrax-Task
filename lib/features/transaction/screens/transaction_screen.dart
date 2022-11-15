import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/global_variables.dart';
import '../../../models/transaction_list.dart';
import '../../../providers/transaction_provider.dart';
import '../services/transaction_services.dart';
import 'transaction_detail_screen.dart';

class TransactionListScreen extends StatefulWidget {
  static const routeName = '/transaction-list-screen';
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  final TransactionServices transactionServices = TransactionServices();
  var transaction;
  TransactionList? listClass;

  @override
  void initState() {
    super.initState();
    transactionServices.getTransactions(context);
    transaction = Provider.of<TransactionProvider>(context, listen: false);
    listClass = TransactionList(transaction.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Transactions'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: listClass == null
            ? const Center(child: CircularProgressIndicator())
            : Consumer<TransactionProvider>(
                builder: (context, provider, listTile) {
                return ListView.builder(
                  itemCount: transaction!.list.length,
                  itemBuilder: buildList,
                );
              }),
      ),
    );
  }

  Widget buildList(BuildContext context, index) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        TransactionDetailScreen.routeName,
        arguments: listClass!.list[index],
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          title: Text(
            listClass!.list[index].type,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            listClass!.list[index].date,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                listClass!.list[index].amount,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                listClass!.list[index].currencyCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
