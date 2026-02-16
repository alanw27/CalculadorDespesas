import 'package:calcula_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  HomeApp({super.key});

  final _transaction = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Minhas despesas", style: TextStyle(color: Colors.white),)
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Text("Gráfico", style: TextStyle(color: Colors.white),),
              ),
          ),
          Column(
            children: _transaction.map((t) {
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
                          DateFormat("dd/mm/YYYY", t.date.toString()).toString() ,
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
          )
        ],
      ),
    );
  }
}