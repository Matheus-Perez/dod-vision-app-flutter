import 'package:flutter/material.dart';

class SubTitleDefault extends StatelessWidget {
  String texto;
  double fontSize;
  Color fontColor; 
  
  EdgeInsets margin; 

  SubTitleDefault({this.texto, this.fontSize, this.margin, this.fontColor});

  @override
  Widget build(BuildContext context) {
    fontSize = (fontSize != null)? fontSize:15;
    margin = (margin != null)? margin: EdgeInsets.only(left: 10, right: 10, bottom: 20);
    fontColor = (fontColor != null)? fontColor: Colors.white;

    return Container(
      margin: margin,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'robotoThin', color: fontColor, fontSize: fontSize),
      ),
    );
  }
}
