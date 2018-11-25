import 'dart:async';
import './api.dart';
import '../models/quoteModel.dart';
import 'dart:math';

class Bloc{
  final _quote = StreamController<int>.broadcast();
  final _counter = StreamController<int>.broadcast();
  

  final _quoteTransformer = StreamTransformer<int,QuoteModel>.fromHandlers(
    handleData: (hour,sink) async{
        var quote = await API().fetchQuote(hour); 
        sink.add(quote);
    }
  );

  final _countTransformer = StreamTransformer<int,int>.fromHandlers(
    handleData: (prev,sink) async{ 
        sink.add(Random().nextInt(1000));
    }
  );
    
  //getters
  Function(int) get fetchQuote => _quote.sink.add;
  Stream<QuoteModel> get quote => _quote.stream.transform(_quoteTransformer);
  
  get increment => _counter.sink.add;
  Stream<int> get count => _counter.stream.transform(_countTransformer);
  
  
  _dispose(){
    _quote.close();
    _counter.close();
  }
}



