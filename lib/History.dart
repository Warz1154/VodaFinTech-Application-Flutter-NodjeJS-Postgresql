import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vodaclone/ip_address.dart';

Future<List<dynamic>> get_transactions(String session_id, String user_id) async {
  final response = await http.post(
      Uri.parse('http://$ip_address:5001/get_transactions?session_id=$session_id&user_id=$user_id')
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

Future<List<dynamic>> get_stats(String session_id, String user_id) async{

  final response = await http.post(
      Uri.parse('http://$ip_address:5001/get_stats?session_id=$session_id&user_id=$user_id')
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
class History extends StatefulWidget{
  final String user_id;
  final String token_id;
  History({required this.user_id, required this.token_id});

  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<History> {

  List<dynamic> data = [];
  List<dynamic> stats = [];

  late var total_cards_sold = '0';
  late var total_sales = '0';
  late var revenue = '0';

  @override

  void initState() {
    super.initState();
    fetchTransactions(widget.token_id, widget.user_id);
    fetchStats(widget.token_id, widget.user_id);
  }

  Future<void> fetchTransactions(String session_id, String user_id) async
  {
    try{
      List<dynamic> transactionData = await get_transactions(session_id, user_id);
      if(transactionData.isNotEmpty){
        setState(() {
          data = transactionData;
          print(data);
        });
      }

    }catch(error)
    {
      print('Error fetching user info: $error');
    }

  }

  Future<void> fetchStats(String session_id, String user_id) async{
    try{
      List<dynamic> statsData = await get_stats(session_id, user_id);
      if(statsData.isNotEmpty){
        setState(() {
          stats = statsData;
          print(stats);
          final _init_stats = stats[0]['get_stats'];
          final stats_data = _init_stats.split(',');
          revenue = stats_data[0].replaceAll('(', '').trim();
          total_sales = stats_data[1];
          total_cards_sold = stats_data[2].replaceAll(')', '').trim();
          print('$revenue $total_sales $total_cards_sold');

        });
      }
    }catch(error)
    {
      print('Error fetching user info: $error');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.grey[800],
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [],
                centerTitle: true,
                elevation: 0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Text(
                        'History',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 4, 0, 0),
                      child: Text(
                        'Sales & Revenue',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 19,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        // Customers widget
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.supervisor_account_rounded,
                                    color: Theme.of(context).textTheme.bodyText1!.color,
                                    size: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Text(
                                      '1.4k',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Customers',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Total sales
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Color(0xFFC00508),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.payments,
                                    color: Colors.white,
                                    size: 44,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Text(
                                      '$total_sales EGP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Total Sales',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // Revenue
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pie_chart_rounded,
                                    color: Theme.of(context).textTheme.bodyText1!.color,
                                    size: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Text(
                                      '$revenue EGP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Revenue',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.black, // Assuming primaryText is equivalent to bodyText1 color
                                    size: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Text(
                                      '$total_cards_sold',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Cards sold',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Your transactions
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 12),
                      child: Text(
                        'Your transactions',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final transaction = data[index]['get_transactions'];
                            final transactionparts = transaction.split(',');
                            final String balance = transactionparts[0].replaceAll(')', '').replaceAll('(', '').trim();
                            final String title = (transactionparts[1].replaceAll(')', '').replaceAll('(', '').trim()).replaceAll('"', '').trim();
                            final String card_value = transactionparts[2].replaceAll(')', '').replaceAll('(', '').trim();

                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 570,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '$title Card',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 19,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                              child: Text(
                                                'Balance: $balance EGP',
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '$card_value EGP',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
