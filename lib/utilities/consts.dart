import 'package:flutter/material.dart';

const kInfoStyle = TextStyle(
    color: Color.fromRGBO(255, 116, 134, 1.0),
    fontWeight: FontWeight.bold,
    fontSize: 40.0);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide.none,
  ),
);
