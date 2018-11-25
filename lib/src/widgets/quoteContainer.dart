import 'package:flutter/material.dart';
import '../utils/bloc.dart';
import '../models/quoteModel.dart';
import '../utils/api.dart';

class QuoteContainer extends StatelessWidget {
  var _quote;
  Bloc bloc;
  String _imageURI ="https://picsum.photos/800/1000/?random";

  QuoteContainer.hasData(Bloc _bloc,QuoteModel quote){
    _quote = quote;
    bloc = _bloc;
  }
  QuoteContainer.noData(Bloc _bloc){
    _quote = null;
    bloc = _bloc;
  }

  Widget quoteIcon(){
    return Icon(
      Icons.format_quote,
      color: Colors.white,
      size:80.0
    );
  }

  Widget quoteBody(){
   return Text(
    "${_quote.body}",
      style: TextStyle(
        fontFamily: "Sanserif",
        color:Colors.white,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        fontSize: _quote.body.length > 80 ? 18.0 : 25.0
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget favIcon(){
    return RaisedButton.icon(
     icon:Icon(
        Icons.favorite_border,
        size: 30.0,
        color:Colors.white,
      ),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      highlightColor: Colors.white,
      onPressed: (){
        API().likeQuote(_quote.index);
      },
      label: Text(
        _quote.likes == null ? '0' : '${_quote.likes}',
        style: TextStyle(
          color:Colors.white,
        ),
      ),
      color: Colors.red,
    );
  }

  Widget quoteAuthor(){
    return Text(
      '${_quote.author}',
      style: TextStyle(
        fontFamily: "Sanserif",
        letterSpacing: 1.0,
        fontSize: 20.0,
        color:Colors.white70
      ),
    );
  }

  Widget quoteBodyloading(){
    return Column(children: <Widget>[
      Container(
        height: 10.0,
        width: 200.0,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      Container(margin: EdgeInsets.only(top:30.0),),
      Container(
        height: 10.0,
        width: 200.0,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
       Container(margin: EdgeInsets.only(top:30.0),),
       Container(
        height: 10.0,
        width: 200.0,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      Container(margin: EdgeInsets.only(top:80.0),),
      Text(
        'pull down to refresh...',
        style: TextStyle(
          fontFamily: "Sanserif",
          letterSpacing: 1.5,
          fontSize: 12.0,
          color: Colors.white
        ),
      )
    ],);
  }

  Widget quoteContainer(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(margin: EdgeInsets.only(top:10.0),),
          quoteBody(),
          Container(margin: EdgeInsets.only(top:30.0),),
          quoteAuthor(),
          Container(margin: EdgeInsets.only(top:50.0),),
          favIcon(),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    String imageURI;
     return StreamBuilder(
      stream: bloc.count,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          imageURI = "https://picsum.photos/800/1000/?image=${snapshot.data}";
        }else{
          imageURI = "https://picsum.photos/800/1000/?image=0";
        }
        return Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height/1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image:NetworkImage(imageURI),
              fit:BoxFit.fill
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              quoteIcon(),
              Container(margin: EdgeInsets.only(top:10.0),),
              _quote == null ? quoteBodyloading() : quoteContainer()
            ],
          )
        );
      },
    );
  }
}