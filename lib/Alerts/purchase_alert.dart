import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vodaclone/Alerts/serial_available.dart';
import 'dart:convert';
import '../ip_address.dart';
import 'no_available_serial.dart';



Future<List<dynamic>> Purchase(String card_type, String card_value, String session_id, String user_id) async {

  print(card_type);
  print(card_value);
  print(session_id);
  final response = await http.post(
    Uri.parse('http://$ip_address:5001/approve_purchase?card_type=$card_type&card_value=$card_value&session_id=$session_id&user_id=$user_id')
  );
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}


Future<List<dynamic>> fetchPurchase(String card_type, String card_value, String session_id, String user_id) async {
  List<dynamic> userData = [];
  try {
    userData = await Purchase(card_type, card_value, session_id, user_id);

  } catch (error) {
    print('Error fetching user info: $error');
  }
  return userData;
}


openAlertBox_purchase(
    BuildContext context, String card_type, String card_value, String token_id, String user_id) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  // Calculate the width of the SizedBox
  final sizedBoxWidth = screenWidth * 0.061; // Adjust the percentage as needed

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: screenWidth * 0.8, // Adjust the width as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              SizedBox(
                height: screenHeight * 0.02,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "Are you sure you want to buy $card_type Card ?",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                          ),
                        ),
                        child: Text(
                          "NO",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: sizedBoxWidth), // Adjust the width of SizedBox
                  GestureDetector(
                    onTap: () async{
                      List<dynamic> serial_id = await fetchPurchase(card_type, card_value, token_id, user_id);
                      final serialPart = serial_id[0]['approve_purchase'];

                      if(serialPart.contains('-1')){
                        Navigator.of(context).pop();
                        // Split the input string using space as the delimiter
                        List<String> words = serialPart.split(' ');

                        // Filter out the "-1" substring and join the remaining words
                        String result = words.where((word) => word != '-1').join(' ');

                        openAlertBoxNoAvailableSerial(context, result);
                      }
                      else{
                        Navigator.of(context).pop();
                        openAlertBoxNoAvailableSerial(context, serialPart);
                      }
                    },
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(screenWidth * 0.03, 0, 0, 0),
                        child: Container(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.35,
                          padding: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(32.0),
                            ),
                          ),
                          child: Text(
                            "YES",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

