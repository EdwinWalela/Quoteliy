import 'package:flutter/material.dart';
import '../widgets/quoteContainer.dart';
import '../utils/bloc.dart';

class HomeScreen extends StatelessWidget {
  final bloc = Bloc();
  Future<void> _handleRefresh()async{
    await bloc.increment(0);
    return await bloc.fetchQuote(2);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.quote,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Colors.red,
            displacement: 50.0,
            onRefresh:_handleRefresh,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                color: Colors.white,
                child:QuoteContainer.hasData(bloc,snapshot.data),
                height: MediaQuery.of(context).size.height/1.1,
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
                child:QuoteContainer.noData(bloc),
                height: MediaQuery.of(context).size.height/1.15,
              ),
            ),
          );
        }
      }
    );
  }
}

