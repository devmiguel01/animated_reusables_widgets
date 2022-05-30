

import 'package:flutter/material.dart';


import '../utils/colors.dart';
import '../utils/fontFamily.dart';



class PrimaryButonWidget extends StatelessWidget {


  PrimaryButonWidget({

    required this.onTap,
    required this.text,
    required this.hasBackground


  })
      : super();

  final GestureTapCallback onTap; // Button Click callback function
  // Define if button has background or no
  bool hasBackground=true;
  String text; // Define button content text


  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 20, right: 20),

      child: SizedBox(
        width: double.infinity,

        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white),

            backgroundColor:
            MaterialStateProperty.all<Color>(hasBackground?primaryColor:Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(color: primaryColor) ,
                borderRadius: BorderRadius.circular(10),

              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              text,
              style: TextStyle(
                color: hasBackground?Colors.white:Colors.black,
                  fontSize: 18,
                  fontFamily: apppPrimaryFont
              ),
            ),
          ),
        ),
      ),
    );
  }
}

