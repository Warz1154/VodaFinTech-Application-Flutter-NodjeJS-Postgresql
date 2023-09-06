import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ip_address.dart';

class DynamicTextWidget_balance extends StatefulWidget {
  final String balance;
  DynamicTextWidget_balance({required this.balance});

  @override
  _DynamicTextWidgetState createState() => _DynamicTextWidgetState();
}

class _DynamicTextWidgetState extends State<DynamicTextWidget_balance> {
   // Initialize with an empty balance


  @override
  Widget build(BuildContext context) {


    return Text(
      '${widget.balance} EGP',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFFC00508),
      ),
    );
  }

}
