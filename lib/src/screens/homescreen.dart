import 'package:flutter/material.dart';
import '../widgets/quoteContainer.dart';

class HomeScreen extends StatelessWidget {

  Future<void>_handleRefresh()async{
    // Fetch new quote (call bloc's add)
    return await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
     return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.red,
      displacement: 50.0,
      onRefresh:_handleRefresh,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child:QuoteContainer(),
          height: MediaQuery.of(context).size.height/1.15,
        ),
      ),
    );
    
  }
}

