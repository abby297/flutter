import 'package:building_real_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
//import './widgets/user_transaction.dart';
import './widgets/Transaction_List.dart';
import './widgets/new_transaction.dart';
import './models/transaction1.dart';
import './widgets/chart.dart';

//import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      title: 'personal expenses',
      home: Expense(),
    ));

class Expense extends StatefulWidget {
  //String titleInput;
  //String amountInput;
  //final titleController = TextEditingController();
  //final amountController = TextEditingController();

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final List<Transaction> newList = [
    // Transaction(
    //   "t1",
    //   "title",
    //   72.72,
    //   DateTime.now(),
    // ),
    // Transaction(
    //   "t2",
    //   "Sneakers",
    //   87.72,
    //   DateTime.now(),
    // )
  ];
  List<Transaction> get recentTrans {
    return newList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      DateTime.now().toString(),
      txTitle,
      txAmount,
      DateTime.now(),
    );

    setState(() {
      newList.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          title: Text(
            'expense planner',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => startAddNewTransaction(context))
          ],
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chart(recentTrans),
                  SizedBox(
                    height: 20,
                  ),
                  TransactionList(newList),
                  FloatingActionButton(
                      onPressed: () => startAddNewTransaction(context),
                      child: Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
