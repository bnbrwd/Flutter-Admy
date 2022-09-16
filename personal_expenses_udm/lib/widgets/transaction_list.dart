import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  const TransactionList(
      {super.key, required this.transaction, required this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/read.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           horizontal: 15,
                //           vertical: 10,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           '₹${transaction[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transaction[index].title,
                //             style: Theme.of(context).textTheme.titleMedium,
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transaction[index].date),
                //             style: const TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: FittedBox(
                          child: Text(
                              '₹${transaction[index].amount.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                        onPressed: () => deleteTx(transaction[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        )),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
      //Approach2
      // child: ListView(
      //   children: transaction.map((tx) {
      //     return Card(
      //       child: Row(
      //         children: [
      //           Container(
      //             margin: const EdgeInsets.symmetric(
      //               horizontal: 15,
      //               vertical: 10,
      //             ),
      //             decoration: BoxDecoration(
      //               border: Border.all(
      //                 width: 2,
      //                 color: Colors.purple,
      //               ),
      //             ),
      //             padding: const EdgeInsets.all(10),
      //             child: Text(
      //               '₹${tx.amount}',
      //               style: const TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20,
      //                 color: Colors.purple,
      //               ),
      //             ),
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 tx.title,
      //                 style: const TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 16,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //               Text(
      //                 DateFormat.yMMMd().format(tx.date),
      //                 style: const TextStyle(color: Colors.grey),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     );
      //   }).toList(),
      // ),
    );
  }
}
