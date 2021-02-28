import 'package:expense_app/components/transactioncard.dart';
import 'package:flutter/material.dart';

import '../transaction.dart';

class Expense extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  Expense({@required this.transactions, @required this.deleteTransaction});

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "No transactions added yet!",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionCard(
                id: this.widget.transactions[index].id,
                title: this.widget.transactions[index].title,
                price: this.widget.transactions[index].price,
                date: this.widget.transactions[index].date,
                deleteTransaction: widget.deleteTransaction,
              );
            },
            itemCount: this.widget.transactions.length,
          );
  }
}
