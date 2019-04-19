import 'package:flutter/material.dart';
import 'package:vagas_dod/widgets/subtitle-default-widget.dart';
import 'package:vagas_dod/widgets/useful-widget.dart';
class ProgressBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: UsefulWidget.primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 10,),
            SubTitleDefault(
              texto: 'Carregando...',
              fontSize: 25,
            )
          ],
        ),
      ),
    );
  }
}