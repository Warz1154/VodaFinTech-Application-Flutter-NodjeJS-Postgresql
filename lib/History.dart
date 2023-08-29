import 'package:flutter/material.dart';

class History extends StatelessWidget {
  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController pwController = TextEditingController();

  late final String usernameHintText = 'Username/Email';
  late final String pwHintText = 'Password';

  late final String fbImgPath = 'assetsf/logos/Facebook_logo.png';
  late final String googleImgPath = 'assetsf/logos/Google_logo.png';
  late final String vodafoneImgPath = 'assetsf/logos/vodafone_logo.png';
  late final String vodafoneBackgroundPath = 'assetsf/logos/vodabackground.jpg';

  void signUserIn() {
    // Implement your sign-in logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
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
                    //Navigator.of(context).pop();
                  },
                ),
                actions: [],
                centerTitle: true,
                elevation: 0,
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 230, 0),
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            // You can adjust the fontSize according to your needs
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
                            fontSize: 19
                          ),

                        ),
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          //Customers widget
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0), //start top end bottom
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4, //Creates upon the return of the device size query
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
                                        fontSize: 17
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //Total sales

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
                                        '53.2K EGP',
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
                          //Revenue
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
                                        '1423 EGP',
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
                                          fontSize: 17
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
                                        '452',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          color: Colors.black,
                                          fontSize: 23,
                                          fontWeight: FontWeight.w500,
                                        ),                                    ),
                                    ),
                                    Text(
                                      'Cards sold',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 17
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                      const SizedBox(height: 20,),

                      // Your transactions
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 12),
                        child: Text(
                          'Your transactions',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            fontSize: 17
                          ),
                        )
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
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
                                        '10 EGP Card',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                        child: Text(
                                          'Balance: 2123 EGP',
                                          style: TextStyle(
                                            color: Colors.grey[600]
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '14 EGP',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )




                    ],
                  ),
                ),
              )


              // Place your other widgets here
            ],
          ),
        ),
      ),
    );
  }
}
