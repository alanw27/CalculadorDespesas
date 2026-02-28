import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;
  final void Function (String) onDeleted;

  const TransactionList(this.transactions,this.onDeleted, {super.key});

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
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(6),
                child: CircleAvatar(
                  child: FittedBox(
                    child: Text(
                      "R\$ ${t.value}"
                    ),
                  ),
                ),
              ),
              title: Text(
                "${t.title}",
                style: Theme.of(context).textTheme.titleLarge,        
              ),
              subtitle: Text(
                DateFormat("d MMM y").format(t.date!)
              ),
              trailing: IconButton(
                onPressed: (){ onDeleted(t.id!); }, 
                icon: Icon(Icons.delete),
                color: Colors.red
              ),
            ),
          );
        }
      ),
    );
  }
}