import 'package:flutter/material.dart';
import './src/app.dart';
import './src/utils/api.dart';
import './src/models/quoteModel.dart';

void main() async{
  runApp(App());
  var api = API();
  await api.fetchQuote(1);
}