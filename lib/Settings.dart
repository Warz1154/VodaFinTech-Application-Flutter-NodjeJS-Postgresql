import 'package:flutter/material.dart';

class AccountSettingWidget extends StatefulWidget {
  const AccountSettingWidget({Key? key}) : super(key: key);

  @override
  _AccountSettingWidgetState createState() => _AccountSettingWidgetState();
}

class _AccountSettingWidgetState extends State<AccountSettingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/Logos/no_profile.jpeg',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abdelrahman Mahmoud',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(
                                  'abdelrahmanm.lotfyy@gmail.com',
                                  style: TextStyle(fontSize: 14),
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

              // Change profile picture setting
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800], // Replace with your desired color
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.picture_in_picture,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Change profile Picture',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Change email setting
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800], //
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Change Email',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Notification settings
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Notification Settings',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Edit profile setting
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Support setting
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Support',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Terms of Service setting
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.privacy_tip_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              'Terms of Service',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
