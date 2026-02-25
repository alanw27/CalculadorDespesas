import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty ? 
      SizedBox(
        height: 300,
        child: Column( 
          children: [
            Text(
              "Nenhuma transação cadastrada",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: Image.asset(
                "assets/images/waiting.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ) 
      : 
      ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
        final t = transactions[index];
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
                      color: Theme.of(context).primaryColor,
                      width: 2
                    )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "R\$ ${t.value!.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
                      style: Theme.of(context).textTheme.titleMedium
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
        }
      ),
    );
  }
}