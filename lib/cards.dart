import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




Future<List<dynamic>> fetchData(String username) async {
  final response = await http.get(
      Uri.parse('http://192.168.0.143:5001/get_data?username=$username')
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


class  cards extends StatelessWidget
{
  late final UsernameController = TextEditingController();
  late final PwController = TextEditingController();

  late final String UsernameHintText = 'Username/Email';
  late final String PwHintText = 'Password';

  late final String fbimgoath = 'assetsf/logos/Facebook_logo.png';
  late final String googleimgpath = 'assetsf/logos/Google_logo.png';
  late final String vfoneimgpath = 'assetsf/logos/vodafone_logo.png';
  late final String vodabackgroundpath = 'assetsf/logos/vodabackground.jpg';

  void signUserIn() {}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Logos/Voda_background_Red.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 100,),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
              child: Container(

                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                          child: Container(
                            width: 150,
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
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                      child: Container(
                                        width: 150,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                                      child: Text(
                                        ' 10 Credits\nCost: 11 EGP',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 7, 0),
                          child: Container(
                            width: 150,
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
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                      child: Container(
                                        width: 150,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                                      child: Text(
                                        ' 10 Credits\nCost: 11 EGP',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
              child: Container(

                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                          child: Container(
                            width: 150,
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
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                      child: Container(
                                        width: 150,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                                      child: Text(
                                        ' 10 Credits\nCost: 11 EGP',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 7, 0),
                          child: Container(
                            width: 150,
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
                                      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                      child: Container(
                                        width: 150,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                                      child: Text(
                                        ' 10 Credits\nCost: 11 EGP',
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),



                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),


            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
              child: Container(
                width: 150,
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
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Container(
                            width: 150,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                          child: Text(
                            ' 10 Credits\nCost: 11 EGP',
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        )
        ,
      ),
    );
  }
}


