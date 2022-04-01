import 'package:flutter/material.dart';

const KsendButtonTextStyle = TextStyle(
    color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 18);

const KMessageTextFieldDecorationn = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    hintText: 'Type your message here....',
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.grey));

const KMessageContainerDecoration = BoxDecoration(
    border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)));
