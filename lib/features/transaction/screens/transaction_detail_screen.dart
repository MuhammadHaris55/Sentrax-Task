import 'package:flutter/material.dart';
import '../../../constant/global_variables.dart';
import '../../../models/transaction.dart';
import '../widgets/profile_details_row.dart';

class TransactionDetailScreen extends StatefulWidget {
  static const routeName = '/transaction-detail-screen';
  Transaction transaction;

  TransactionDetailScreen({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.backgroundColor,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(52),
                  bottomLeft: Radius.circular(52),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.transaction.amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const Text(
                    'amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                // color: Colors.white,
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  transactionDetailsRows(
                    name: 'Date',
                    value: widget.transaction.date,
                  ),
                  transactionDetailsRows(
                    name: 'Iban',
                    value: widget.transaction.iban,
                  ),
                  transactionDetailsRows(
                    name: 'Type',
                    value: widget.transaction.type,
                  ),
                  transactionDetailsRows(
                    name: 'Currency Code',
                    value: widget.transaction.currencyCode,
                  ),
                  transactionDetailsRows(
                    name: 'Description',
                    value: widget.transaction.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
