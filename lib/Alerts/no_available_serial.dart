import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

openAlertBoxNoAvailableSerial(BuildContext context, String msg) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  int txtSize = msg.length;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.08)),
        ),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: Container(
            width: screenWidth * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.075,
                    vertical: screenHeight * 0.02,
                  ),
                  child: Text(
                    "$msg",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenWidth * 0.08),
                      bottomRight: Radius.circular(screenWidth * 0.08),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
