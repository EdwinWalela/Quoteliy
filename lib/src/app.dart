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
        appBar:AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          title:Text(
            'Quoteliy',
            style: TextStyle(
              color: Colors.red,
              fontFamily: "helvetica",
              letterSpacing: 2.0
            ),
          ),
          centerTitle: true,
        ),
        body:HomeScreen(),
      )
    );
  }
}