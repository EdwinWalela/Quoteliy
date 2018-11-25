import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/quoteContainer.dart';
import '../utils/bloc.dart';

class HomeScreen extends StatelessWidget {
  final bloc = Bloc();
  Future<void> _handleRefresh()async{
    SystemChrome.setEnabledSystemUIOverlays([]);
    int baseTime = 1543176491*1000;
    Duration diff = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(baseTime));
    await bloc.increment(0);
    return await bloc.fetchQuote((diff.inHours/12).floor());
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
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child:QuoteContainer.hasData(bloc,snapshot.data),
                height: MediaQuery.of(context).size.height,
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
                height: MediaQuery.of(context).size.height,
              ),
            ),
          );
        }
      }
    );
  }
}

