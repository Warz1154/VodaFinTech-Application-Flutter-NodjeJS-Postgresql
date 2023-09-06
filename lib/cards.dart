import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'Queries/get_cards.dart';
import 'ip_address.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Alerts/purchase_alert.dart';


class Cards extends StatefulWidget {
  final String user_id;
  final String token_id;
  Cards({required this.user_id, required this.token_id});

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<dynamic> data = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the function to fetch data here
  }

  Future<void> fetchData() async {
    try {
      List<dynamic> userData = await get_cards();
      if (userData.isNotEmpty) {
        setState(() {
          data = userData;
        });
      }

    } catch (error) {
      print('Error fetching user info: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          fetchData();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red[800],
          ),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final getCardsValue = data[index]['get_cards'];
              final valueParts = getCardsValue.split(',');

              if (valueParts.length == 2) {
                final cardValue = (valueParts[0].replaceAll('(', '').trim()).replaceAll('"', '').trim();
                final costValue = valueParts[1].replaceAll(')', '').trim();

                return Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 7, 20),
                  child: GestureDetector(
                    onTap: (){
                      openAlertBox_purchase(context, cardValue, costValue, widget.token_id, widget.user_id);

                    },
                    child: Container(
                      width: 100,
                      height: 190,
                      decoration: BoxDecoration(
                        color: Color(0x31D8D7D7),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
                                child: Container(
                                  width: 300,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/Logos/voda_cards.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  '$cardValue',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                child: Text(
                                  'Cost $costValue EGP',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),

        ),
      ),
    );
  }
}
