import 'package:flutter/material.dart';
import './new_transaction.dart';
import './Transaction_List.dart';
import '../models/transaction1.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    List<Transaction> newList;
    return Column(
      children: [
        //NewTransaction(addNewTransaction),
        SizedBox(
          height: 20,
        ),
        TransactionList(newList),
      ],
    );
  }
}
