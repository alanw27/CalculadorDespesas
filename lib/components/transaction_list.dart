import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: transactions.map((t) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2
                        )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "R\$ ${t.value!.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        Text(
                          DateFormat("dd/mm/YYYY").format(t.date!) ,
                          style: TextStyle(
                            color: Colors.blueGrey[100]
                          ),
                        )
                      ],
                    )
                  ],
                )
              );
            }).toList(),
          );
  }
}