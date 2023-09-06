import 'package:http/http.dart' as http;
import 'dart:convert';

import '../ip_address.dart';

Future<List<dynamic>> get_user_balance(String user_id, String ip_address) async {
  final response = await http.post(
      Uri.parse('http://$ip_address:5001/get_user_balance?user_id=$user_id')
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