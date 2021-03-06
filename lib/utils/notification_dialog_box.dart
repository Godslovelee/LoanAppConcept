import 'package:flutter/material.dart';
import 'package:login_basic/constants/constants.dart';

class CustomDialog extends StatefulWidget {

  final String title, descriptions, text;
  final Image img;

  const CustomDialog({Key key, this.title, this.descriptions, this.text, this.img}) : super(key: key);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {


    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );

  }
}
contentBox(context){
  return Stack(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
            + Constants.padding, right: Constants.padding,bottom: Constants.padding
        ),
        margin: EdgeInsets.only(top: Constants.avatarRadius),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: [
              BoxShadow(color: Colors.blue,offset: Offset(0,10),
                  blurRadius: 10
              ),
            ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Welcome",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            SizedBox(height: 15,),
            Text('Congrats!! you are eligible for 1000# Advance',style: TextStyle(fontSize: 17),textAlign: TextAlign.center,),
            SizedBox(height: 22,),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("okay",style: TextStyle(fontSize: 18),)),
            ),
          ],
        ),
      ),
      Positioned(
        left: Constants.padding,
        right: Constants.padding,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: Constants.avatarRadius,
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
              child: Image.asset("assets/profit.png")
          ),
        ),
      ),
    ],
  );
}

