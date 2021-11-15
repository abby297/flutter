import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction1.dart';
//import './Transaction_List.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> newTransaction;
  TransactionList(this.newTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: newTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  '''No Transaction Added Yet!
                         🥴''',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'images/filmora.png',
                  fit: BoxFit.cover,
                )
              ],
            )
          : Column(
              children: newTransaction.map((statement) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        ' \$${statement.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          statement.title,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(statement.date),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                elevation: 20,
              );
            }).toList()),
    );
  }
}
