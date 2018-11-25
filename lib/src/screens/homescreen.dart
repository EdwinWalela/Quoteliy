import 'package:flutter/material.dart';
import '../widgets/quoteContainer.dart';
import '../utils/bloc.dart';

class HomeScreen extends StatelessWidget {
  final bloc = Bloc();
  Future<void> _handleRefresh()async{
    return await bloc.fetchQuote(1);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.quote,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          print('${snapshot.data.author}'); 
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            displacement: 50.0,
            onRefresh:_handleRefresh,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                color: Colors.white,
                child:QuoteContainer.hasData(snapshot.data),
                height: MediaQuery.of(context).size.height/1.15,
              ),
            ),
          );
        }else{
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            displacement: 50.0,
            onRefresh:_handleRefresh,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                color: Colors.white,
                child:QuoteContainer.noData(),
                height: MediaQuery.of(context).size.height/1.15,
              ),
            ),
          );
        }
      }
    );
  }
}

