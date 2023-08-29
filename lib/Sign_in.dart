

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'HomePage.dart';
import 'Wrong_alert.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




Future<List<dynamic>> fetchData(String username, String password) async {
  final response = await http.post(
      Uri.parse('http://192.168.0.151:5001/get_data?username=$username&password=$password')
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

Future<void> _showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog( // <-- SEE HERE
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Wrong Username or Password!',
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


class Sign_in extends StatefulWidget{

  @override
  State<Sign_in> createState() => _Sign_in_state();

}

class  _Sign_in_state extends State<Sign_in>
{
  late final UsernameController = TextEditingController();
  late final PwController = TextEditingController();

  late final String UsernameHintText = 'Username/Email';
  late final String PwHintText = 'Password';

  late final String fbimgoath = 'assetsf/logos/Facebook_logo.png';
  late final String googleimgpath = 'assetsf/logos/Google_logo.png';
  late final String vfoneimgpath = 'assetsf/logos/vodafone_logo.png';
  late final String vodabackgroundpath = 'assetsf/logos/vodabackground.jpg';

  bool passToggle = true;
  final _formfield = GlobalKey<FormState>();

  //Validation

  bool emailValid = false;
  bool pwValid = false;

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Logos/Voda_background_Red.jpg"),
              fit: BoxFit.fitHeight,
            )
          ),
          child: Column(
            children: [
              //vodaLogo
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black)
                      ),
                      child:Image.asset(
                        "assets/Logos/voda_blacklogo.png",
                        height: 210,
                        width: 280,
                      )
                  )
                ],
              ),
              const SizedBox(height: 40),


              //Welcome Back + Username/Email + password
              Container(
                height: 530,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.white60,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, 3), // Offset in the x and y directions
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                  //Welcome back

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF4E4E4E),
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //username/email textfield


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: UsernameController,
                          decoration: InputDecoration(

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDBE2E7)),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            prefixIcon: Icon(Icons.email_rounded,
                              color: Colors.grey[500],
                            ),
                            fillColor: Colors.white60,
                            filled: true,
                            hintText: UsernameHintText,
                            hintStyle: TextStyle(color: Colors.grey[600]),

                          ),


                      ),
                    ),

                    const SizedBox(height: 20),

                    //password textfield

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        obscureText: passToggle,
                        controller: PwController,

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDBE2E7)),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            fillColor: Colors.white60,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[500]
                            ),
                            hintText: PwHintText,
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            suffix: InkWell(
                                onTap: (){
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                                child: Icon(passToggle? Icons.visibility : Icons.visibility_off)

                            ),

                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //sign in button

                    GestureDetector(
                      onTap:() async {

                        // Store user input in the variable
                        var usernameInput = UsernameController.text;
                        var passwordInput = PwController.text;
                        List<dynamic> data;

                        print("$usernameInput $passwordInput");

                        try {
                          data  = await fetchData(usernameInput, passwordInput);
                          if (data.isNotEmpty && data[0] is Map) {
                            Map<String, dynamic> firstRecord = data[0];
                            String username = firstRecord['username'];
                            String password = firstRecord['password'];
                            print('Username: $username');
                            print('Password: $password');

                            if(username == usernameInput && password == passwordInput){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()) // Added closing parenthesis here
                              );

                            }

                          }
                          else {
                            openAlertBox(context);
                            print("No data received or data format is incorrect");
                          }
                        } catch (error) {
                          print('Error: $error');
                        }

                        //empty a list incase tried to sign in the same screen
                        data = [];

                      },
                      child: Container(
                        width: 370,
                        height: 69,
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                    ),
                    const SizedBox(height: 25),

                    // Don't have an account
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                          child: Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              color: Color(0xFF14181B),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 4),
                          child: Text(
                            'Sign Up Here',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              color: Color(0xFFCE035F),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 0,),

                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ElevatedButton(
                        onPressed: (){
                          // if(_formfield.currentState!.validate()){
                          //   print("Success");
                          //   UsernameController.clear();
                          //   PwController.clear();
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color(0xFF57636C),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: Size(370, 44),
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'Space Grotesk',
                            color: Color(0xFF57636C),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),


                    //Sign in with google
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        icon: Image.asset(
                          'assets/Logos/Google_logo.png', // Replace with your image asset path
                          width: 30,
                          height: 30,
                           // Set the desired image color
                        ),
                        label: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Color(0xFF606060),
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Roboto', // Use the desired font family
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 4,
                          side: BorderSide.none, // Use BorderSide.none to remove border
                          minimumSize: Size(230, 44),
                          padding: EdgeInsets.zero, // Set padding to zero
                          alignment: Alignment.centerLeft,
                          //padding: EdgeInsets.only(left: 8), // Add some spacing to the left of the text
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


