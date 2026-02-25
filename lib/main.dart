
import 'package:calcula_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'components/chart.dart';
import 'dart:math';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData tema = ThemeData();
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeApp(),
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          titleMedium: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
        primarySwatch: Colors.purple ,
        fontFamily: "Quicksand",
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
      ),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  final List<Transaction> transaction = [];

  List<Transaction> get _recentTransactions {
    return transaction.where((t) {
      return t.date!.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(_addTransacion);
      }
    );
  }

  void _addTransacion(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: DateTime.now()
    );

    setState(() {
      transaction.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas despesas", 
          style: TextStyle(
            fontFamily: 'OpenSans'
            ),
          ),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context), 
            icon: Icon(
              Icons.add
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Chart(_recentTransactions),
                ),
            ),
            TransactionList(transaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(
          Icons.add
        ),
        ),
      );
    }
  }
