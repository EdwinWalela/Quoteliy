//import './src/utils/api.dart';
//  var api = API();
//   await api.fetchQuote(1);
//   await api.likeQuote(1);
//   await api.fetchQuote(1);
import 'dart:async';
import './api.dart';
import '../models/quoteModel.dart';

class Bloc{
  //refreshStream
  final _quote = StreamController<int>();
  //quote transformers
  final _quoteTransformer = StreamTransformer<int,QuoteModel>.fromHandlers(
    //check time,send request,add to stream
    handleData: (hour,sink) async{
        var quote = await API().fetchQuote(hour); 
        sink.add(quote);
    }
  );
    
  //getters
  //sink.add
  Function(int) get fetchQuote => _quote.sink.add;
  //stream with transformers
  Stream<QuoteModel> get quote => _quote.stream.transform(_quoteTransformer);
  
  
  _dispose(){
    _quote.close();
  }
}



