import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vodaclone/ip_address.dart';


Future<List<dynamic>> get_user_info(String user_id, String ip_adress) async {
  final response = await http.post(
      Uri.parse('http://$ip_adress:5001/get_user_info?user_id=$user_id')
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, then parse the JSON.
    List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    // If the server returns an unsuccessful response code, throw an exception.
    throw Exception('Failed to load data');
  }
}

class DynamicTextWidget extends StatefulWidget {
  final String userId;

  DynamicTextWidget({required this.userId});

  @override
  _DynamicTextWidgetState createState() => _DynamicTextWidgetState();
}

class _DynamicTextWidgetState extends State<DynamicTextWidget> {
  String username = ''; // Initialize with an empty username

  @override
  void initState() {
    super.initState();
    // Fetch user information when the widget initializes
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    try {
      List<dynamic> userData = await get_user_info(widget.userId, ip_address);
      if (userData.isNotEmpty) {
        print(userData);
        setState(() {
          var tmp_username = userData[0]['get_username']; // Adjust the key based on your API response structure
          username = tmp_username.toString();
        });
      }

    } catch (error) {
      print('Error fetching user info: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the font size based on the length of the username
    double fontSize = 14.0; // Default font size
    if (username.isNotEmpty) {
      if (username.length <= 10) {
        fontSize = 18.0;
      } else if (username.length <= 20) {
        fontSize = 16.0;
      } else {
        fontSize = 10.0;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Welcome $username',
        style: TextStyle(
          fontFamily: 'Readex Pro',
          color: Color(0xB3FFFFFF),
          fontSize: fontSize, // Use the calculated font size
        ),
      ),
    );
  }

}
