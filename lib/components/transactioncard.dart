import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  String id;
  String title;
  double price;
  DateTime date;
  final Function deleteTransaction;

  TransactionCard({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date,
    @required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 7),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: FittedBox(
                  child: Text(
                    '฿${price.toString()}',
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              DateFormat().add_yMMMMd().format(date),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => deleteTransaction(id)
            ),
          ),
        ));
  }
}
