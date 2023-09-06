import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'History.dart';
import 'Queries/get_user_balance.dart';
import 'Queries/logout.dart';
import 'Settings.dart';
import 'cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'get_user_info_widgets/Welcome_widget.dart';
import 'get_user_info_widgets/Balance_widget.dart';
import 'ip_address.dart';

ScrollController _scrollController = new ScrollController(
  initialScrollOffset: 0.0,
  keepScrollOffset: true,
);





class Homepage extends StatefulWidget{

  final String user_id;
  final String token_id;
  Homepage({required this.user_id, required this.token_id});

  @override
  State<Homepage> createState() => _HomePage_state();
}

class  _HomePage_state extends State<Homepage>
{
  final ScrollController _scrollController = ScrollController(initialScrollOffset: double.infinity);

  String balance = '';

  @override
  void initState() {
    super.initState();
    // Fetch user information when the widget initializes
    fetchbalance();
  }

  Future<void> fetchbalance() async {
    try {
      List<dynamic> userData = await get_user_balance(widget.user_id, ip_address);
      print(userData);
      if (userData.isNotEmpty) {
        print(userData);
        setState(() {
          var tmp_balance = userData[0]['get_balance']; // Adjust the key based on API response structure
          balance = tmp_balance.toString();
        });
      }

    } catch (error) {
      print('Error fetching user info: $error');
    }
  }

  Future<void> user_logout() async {
    try {
      print('${widget.token_id}');
      List<dynamic> userData = await logout(widget.token_id, ip_address);
      if (userData.isNotEmpty) {
        Navigator.of(context).pop();
      }

    } catch (error) {
      print('Error fetching user info: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async{
            fetchbalance();
          },
          child: SingleChildScrollView(
            //controller: _scrollController,
            reverse: false,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Color(0xFFC00508),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(18, 16, 16, 8),
                            child: Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 37,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DynamicTextWidget(userId: widget.user_id),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11),
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Logos/voda_blacklogo.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Current Balance -----------------------------------------------------------------------------------

                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFC00508),
                          Colors.white,
                        ],
                      )
                  ),
                  child: Container(
                    height: 130,
                    child: ListView(
                      padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 270,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x1F000000),
                                offset: Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFC00508),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Icon(
                                        Icons.group_outlined,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Current balance',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    DynamicTextWidget_balance(balance: balance),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Add more items as needed
                      ],
                    ),
                  ),
                ),

                //Buy mobile Credits

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cards(
                          user_id: widget.user_id,
                          token_id: widget.token_id,
                        ))
                    ).then((_) {
                      // This code will be executed when the Cards screen is popped
                      fetchbalance();
                    });
                  },

                  child: Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Container(
                      width: double.infinity,
                      height: 288,
                      decoration: BoxDecoration(
                        color: Color(0xFFC00508),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/Logos/vodafone_logo.png',
                                      width: 281,
                                      height: 181,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFF6AA3B8),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                'Buy mobile credits',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Add Balance
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x1F000000),
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12, 8, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add Balance',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 64,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFC00508),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Icon(
                                        Icons.attach_money,
                                        color: Colors.black,
                                        size: 24,
                                      ),
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
                ),

                //History -------------------------------------------------------------------------------

                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => History(token_id: widget.token_id, user_id: widget.user_id,)) // Added closing parenthesis here
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 8, 16, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(4, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'History',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 64,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFC00508),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.history,
                                          color: Colors.black,
                                          size: 24,
                                        ),
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
                  ),
                ),

                //Settings ---------------------------------------------------------------------------------------------------

                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountSettingWidget()) // Added closing parenthesis here
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 8, 16, 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(4, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Settings',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 64,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFC00508),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.settings,
                                          color: Colors.black,
                                          size: 24,
                                        ),
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
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: ElevatedButton(
                      onPressed: () {

                        user_logout();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC00508),
                        onPrimary: Color(0xFF14181B),
                        textStyle: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(
                            color: Colors.white,
                            width: 100,
                          ),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.logout,
                            size: 15,
                          ),
                          SizedBox(width: 8),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 30)
              ],
            )

          ),
        ),
      ),
    );
  }
}


