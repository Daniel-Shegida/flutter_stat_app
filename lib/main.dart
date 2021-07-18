import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nav.dart';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Nav(),
    );
  }


}