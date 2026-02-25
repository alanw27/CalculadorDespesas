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
        return {"day": DateFormat.E().format(weekDay)[0], "value": totalSum };
      }
      return {"day": "", "value": 0 };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: 
          groupedTransactions.map((t) {
            return ChartBar(label: t['day'].toString(), value: double.parse(t['value'].toString()), percentage: 0);
          }).toList(),
        
      ),
    );
  }
}