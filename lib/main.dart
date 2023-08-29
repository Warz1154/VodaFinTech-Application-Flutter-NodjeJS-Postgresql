import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'Sign_in.dart';
import 'HomePage.dart';
import 'History.dart';
import 'cards.dart';



// Future<void> connectToDatabase() async {
//   final connection = PostgreSQLConnection(
//       "192.168.0.146",
//       5435,
//       'dart_test',
//       username: 'postgres',
//       password: 'password',
//   );
//
//
//   try {
//     await connection.open();
//     print('Database connection successful'); // Debug output
//   } catch (e) {
//     print('Error connecting to the database: $e'); // Debug output
//   }
//
//   // await connection.query(
//   //     "CREATE TABLE users ("
//   //         "id SERIAL PRIMARY KEY,"
//   //         "username varchar(100),"
//   //         "password varchar(100)"
//   //         ")"
//   // );
//   //print('Table created successfully'); // Debug output
// }




//app manager
void main()
{

  runApp(MyApp());
}


class MyApp extends StatelessWidget
{

  //Constructor
  //Build

  @override
  Widget build(BuildContext context) {
    //Widget Manager
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sign_in(),
    );
  }

}