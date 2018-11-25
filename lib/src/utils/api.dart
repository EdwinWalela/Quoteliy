import 'package:http/http.dart' show get,post;
import 'dart:convert';
import '../models/quoteModel.dart';

class API{
  String baseUrl = "https://quotelie.herokuapp.com";

  Future<QuoteModel> fetchQuote(int index) async{
    var response = await get("$baseUrl/quote/$index");
    var body = jsonDecode(response.body);
    var newQuote = QuoteModel.fromJson(body["body"], body["author"], body["likes"],body["index"]);

    return newQuote;
  }

  void likeQuote(int index) async{
   await post("$baseUrl/quote/like/$index");
  }
}