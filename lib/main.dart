import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentrax_project/router.dart';

import 'features/transaction/screens/transaction_screen.dart';
import 'providers/transaction_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentrax Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: ChangeNotifierProvider<TransactionProvider>(
        create: (context) => TransactionProvider(),
        child: const TransactionListScreen(),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
