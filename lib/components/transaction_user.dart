import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUserState extends State<TransactionUser> {
  final List<Transaction> transaction = [];

  @override
  Widget build(BuildContext context) {

    addTransacion(String title, double value){
      final newTransaction = Transaction(
        id: Random().nextDouble().toString(), 
        title: title, 
        value: value, 
        date: DateTime.now()
      );

      setState(() {
        transaction.add(newTransaction);
      });
    }
    return Column(
      children: [
        TransactionList(transaction),
        TransactionForm(addTransacion),
      ],
    );
  }
}

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => TransactionUserState();
}