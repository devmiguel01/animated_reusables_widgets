
import 'dart:convert';
import 'dart:math';


import 'package:animated_resusables_widgets/utils/animationBiblio.dart';
import 'package:animated_resusables_widgets/utils/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vector_math/vector_math.dart' as vmath;

import '../utils/colors.dart';
import '../utils/fontFamily.dart';
import 'butonWidget.dart';




class ComplexAnimatedCard extends StatefulWidget {
  String title;
  String date;
  String subtitle;
  String  summary;
  List<String>tagTextList;
  bool hasTags;
  String picturePath;
  String actionButonText;
  String dismissText;



  ComplexAnimatedCard({required Key key,
    required this.title,
    this.subtitle="",
    this.summary="",
    this.hasTags=true,
    required this.tagTextList,
    required this.date,
    required this.picturePath,
    required this.actionButonText,
    required this.dismissText,
     }) : super(key: key);

  @override
  _ComplexAnimatedCard createState() => _ComplexAnimatedCard();
}

class _ComplexAnimatedCard extends State<ComplexAnimatedCard> {

  late SnackBar snackBar;

  @override
  void initState() {


    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return

      Dismissible(

          key: UniqueKey(),

          // only allows the user swipe from right to left
          direction: DismissDirection.startToEnd,


          onDismissed: (_) async{


            //WRITE YOUR OWN FUNCTION HERE
            // setState(() {
            //
            //
            //   print("DISMISS");
            //
            //
            //
            //
            // });

            snackBar = SnackBar(content: Text("One element is dismissed"),duration : Duration(milliseconds: 5000));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },


          child:   MShowUpLeft(
              child:  Container(
                margin:EdgeInsets.only(right: 7,left: defaultMargin,bottom: defaultMargin*1.5) ,

                padding: EdgeInsets.only(top: 15,bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(

                      title: Row(
                        children: [
                          Text(widget.title,
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              fontFamily: apppPrimaryFont
                            ),
                          ),
                          Spacer(),
                          Text(widget.date,
                            style: TextStyle(
                                color:  subtitleColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: apppPrimaryFont
                            ),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        margin:EdgeInsets.only(top: 10),
                        child: Text(
                          widget.subtitle,
                          style: TextStyle(
                              color:  subtitleColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: apppPrimaryFont
                          ),
                        ),
                      ),
                      leading: MShowUpLeft(child:Container(
                        margin: EdgeInsets.only(right: defaultMargin*0.6),
                        child:  Image.asset(widget.picturePath,fit: BoxFit.scaleDown ,),
                      ),delay: 250,),//ACCORDING TO THE IMAGE TYPE if it svg, use SvgPicture.asset,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text("")),
                        Expanded(
                            flex: 8,
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Text(
                                widget.summary,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13  ,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: apppPrimaryFont
                                ),

                              ),
                            ))
                      ],
                    ),
                    SizedBox(height: 10,),

                    if(widget.hasTags) Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text("")),
                        Expanded(
                            flex: 8,
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              height:30,

                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,

                                  shrinkWrap: true,

                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return   index%2==0?//To make different amination in tagsList according to the tag position
                                    MShowUpRight(child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        height: 30,
                                        padding: EdgeInsets.only(left: defaultMargin*0.4,right:defaultMargin*0.4 ),

                                        decoration: BoxDecoration(
                                            color: tagsColor,
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.tagTextList.elementAt(index),
                                            style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: apppPrimaryFont
                                            ),
                                          ),
                                        )), delay: middledelay)
                                        :MShowUpLeft(child: Container(
                                        margin: EdgeInsets.only(right: 5),
                                        height: 30,
                                        padding: EdgeInsets.only(left: defaultMargin*0.4,right:defaultMargin*0.4 ),
                                        decoration: BoxDecoration(
                                            color: tagsColor,
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.tagTextList.elementAt(index),
                                            style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: apppPrimaryFont
                                            ),
                                          ),
                                        )), delay: middledelay);
                                  },
                                  itemCount: widget.tagTextList.length
                              ),
                            )




                        ),

                      ],
                    ),
                    SizedBox(height: defaultMargin ,),
                    Row(
                      children: [

                        Expanded(
                          flex: 8,
                          child: Container(
                              margin: EdgeInsets.only(left: 19,right: 8),
                              child:MShowUp(child:  PrimaryButonWidget(
                                text: widget.actionButonText,
                                hasBackground: true,
                                onTap: (){

                                },
                              ),  delay: longDelay,)
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ) ,

              delay:speedDelay)
      ) ;


  }
}





