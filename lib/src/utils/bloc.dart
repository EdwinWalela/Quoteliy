import 'dart:async';
import './api.dart';
import '../models/quoteModel.dart';
import 'dart:math';

class Bloc{
  final _quote = StreamController<int>.broadcast();
  final _counter = StreamController<int>.broadcast();
  final _like = StreamController<int>.broadcast();

  static int imageCount = Random().nextInt(1000);

  final _quoteTransformer = StreamTransformer<int,QuoteModel>.fromHandlers(
    handleData: (hour,sink) async{
        var quote = await API().fetchQuote(hour); 
        sink.add(quote);
    }
  );

  final _countTransformer = StreamTransformer<int,int>.fromHandlers(
    handleData: (_,sink) async{ 
        int seed = Random().nextInt(5);
        if(seed == 2 || seed == 4){
          print('refreshed');
          imageCount = Random().nextInt(1000);
          sink.add(imageCount);
        }else{
          sink.add(imageCount);
        }
    }
  );

  final _likeTransformer = StreamTransformer<int,bool>.fromHandlers(
    handleData: (index,sink){
        API().likeQuote(index);
        sink.add(true);
    }
  );

  //getters
  Function(int) get fetchQuote => _quote.sink.add;
  Stream<QuoteModel> get quote => _quote.stream.transform(_quoteTransformer);
  
  get increment => _counter.sink.add;
  Stream<int> get count => _counter.stream.transform(_countTransformer);

  get incrementLike => _like.sink.add;
  Stream<bool> get like => _like.stream.transform(_likeTransformer);
  
  _dispose(){
    _quote.close();
    _counter.close();
    _like.close();
  }
}



