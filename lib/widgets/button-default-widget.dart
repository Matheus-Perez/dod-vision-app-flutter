import 'package:flutter/material.dart';
import 'package:vagas_dod/widgets/useful-widget.dart';

class ButtonDefault extends StatelessWidget {
  String texto;
  bool loading;
  VoidCallback onTap;
  Color backgroundColor; 
  String fontFamily; 

  ButtonDefault({this.texto, this.onTap, this.loading = false, this.backgroundColor, this.fontFamily});
  
  Widget _textoWidge({String texto}) {
    return Text(
      texto,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 18,
          letterSpacing: 1,
          color: Colors.white),
    );
  }

  Widget _progressBar = CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    backgroundColor = (backgroundColor != null)? backgroundColor : UsefulWidget.secondColor;
    fontFamily = (fontFamily != null)? fontFamily : 'robotoThin';

    return InkWell(
      onTap: (loading)? null: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        height: 50.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: (loading)? _progressBar: _textoWidge(texto: texto),
        ),
      ),
    );
  }
}
