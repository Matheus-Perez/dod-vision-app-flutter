import 'package:flutter/material.dart';
import 'package:vagas_dod/widgets/progressbar-widget.dart';
import 'package:vagas_dod/widgets/useful-widget.dart';
class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  
  void _initWidget() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacementNamed('/home');
  }
  
  @override
  void initState() {
    super.initState();
    _initWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UsefulWidget.primaryColor,
      body: Container(
        child: ProgressBarWidget(),
      ),
    );
  }
}
