
import 'package:flutter/material.dart';

class Transaction {
  String id;
  String title;
  double price;
  DateTime date;

  Transaction({ @required this.title, @required this.price, this.date }) {
    this.id = DateTime.now().toString();
  }
  
}
