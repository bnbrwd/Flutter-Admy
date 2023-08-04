import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_udm/models/transaction.dart';
import 'package:personal_expenses_udm/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({Key? key, required this.recentTransaction}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weakDays = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weakDays.day &&
            recentTransaction[i].date.month == weakDays.month &&
            recentTransaction[i].date.year == weakDays.year) {}
      }
      return {
        'day': DateFormat.E().format(weakDays).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + double.parse(item['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            print('ff----${data['amount'] as double}');
            return ChartBar(
              label: data['day'].toString(),
              spendingAmount: data['amount'] as double,
              spendingPctOfTotal: totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending,
            );
          }).toList(),
        ),
      ),
    );
  }
}
