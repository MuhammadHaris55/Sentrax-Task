import 'package:flutter/material.dart';
import 'package:sentrax_project/features/transaction/screens/transaction_screen.dart';
import 'package:sentrax_project/models/transaction.dart';

import 'features/transaction/screens/transaction_detail_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case TransactionListScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const TransactionListScreen(),
      );

    case TransactionDetailScreen.routeName:
      var transaction = routeSettings.arguments as Transaction;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TransactionDetailScreen(
          transaction: transaction,
        ),
      );

    // case TransactionDetailScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const TransactionDetailScreen(),
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page not found!'),
          ),
        ),
      );
  }
}
