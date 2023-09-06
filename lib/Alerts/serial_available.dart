import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


openAlertBox_serial_available(
    BuildContext context, String serial_id
    ) {

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                SizedBox(
                  height: 5.0,
                ),

                Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text(
                      "Card Serial: $serial_id",
                      style: TextStyle(
                          color: Colors.grey[600]
                      ),

                    )
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: Navigator.of(context).pop,
                      child: InkWell(
                        child: Container(

                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.red[800],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                            ),
                          ),
                          child: Text(

                            "OK",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 100),
                  ],
                ),


              ],
            ),
          ),
        );
      });
}
