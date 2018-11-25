import 'package:flutter/material.dart';
import './screens/homescreen.dart';

class App extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title:'Quoteliy',
      home:Scaffold(
        resizeToAvoidBottomPadding: false,
        body:HomeScreen(),
      )
    );
  }
}