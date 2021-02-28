import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTran extends StatefulWidget {
  final Function addTransaction;

  AddTran({@required this.addTransaction});

  @override
  _AddTranState createState() => _AddTranState();
}

class _AddTranState extends State<AddTran> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  DateTime date;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;

      setState(() {
        date = value;
      });
    });
  }

  void summitData() {
    String title = titleController.text;
    double price = double.parse(priceController.text);

    if (title.isEmpty || price <= 0 || date == null) return;

    widget.addTransaction(title, price, date);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) => summitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "price"),
                controller: priceController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => summitData(),
              ),
              Container(
                height: 100,
                child: Row(
                  children: [
                    Text(date != null
                        ? DateFormat().add_yMMMd().format(date)
                        : "No Date selected"),
                    FlatButton(
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        "Choose date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        _presentDatePicker();
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                  onPressed: summitData,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "Add transaction",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
