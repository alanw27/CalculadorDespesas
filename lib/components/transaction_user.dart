import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUserState extends State<TransactionUser> {

  @override
  Widget build(BuildContext context) {

  final transaction = [
    Transaction(
     id: "t1",
     title: "Novo tênis",
     value: 310.76,
     date: DateTime.now() 
    ),
    Transaction(
     id: "t2",
     title: "Conta luz",
     value: 89.45,
     date: DateTime.now() 
    )
  ];

    return Column(
      children: [
        TransactionList(transaction),
        TransactionForm(),
      ],
    );
  }
}

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => TransactionUserState();
}