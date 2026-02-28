import 'package:calcula_despesas/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      
      double totalSum = 0;

      for(int i = 0; i < recentTransaction.length; ){
        bool someDays = recentTransaction[i].date!.day == weekDay.day;
        bool someMonth = recentTransaction[i].date!.month == weekDay.month;
        bool someYear = recentTransaction[i].date!.year == weekDay.year;

        if(someDays && someMonth && someYear)
        {
          totalSum += recentTransaction[i].value!;
        }
      }
      return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr){
      return sum + (tr["value"] as num).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: 
            groupedTransactions.map((t) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: t['day'].toString(), 
                  value: (t['value'] as num).toDouble(), 
                  percentage: _weekTotalValue > 0 ? (t['value'] as num).toDouble() / _weekTotalValue : 0
                ),
              );
            }).toList(),
          
        ),
      ),
    );
  }
}