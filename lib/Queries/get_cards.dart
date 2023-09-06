import '../ip_address.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<List<dynamic>> get_cards() async {
  final response = await http.post(
      Uri.parse('http://$ip_address:5001/get_cards?')
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