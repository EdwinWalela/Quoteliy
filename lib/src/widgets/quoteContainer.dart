import 'package:flutter/material.dart';

class QuoteContainer extends StatelessWidget {

  Widget quoteIcon(){
    return Icon(
      Icons.format_quote,
      color: Colors.white,
      size:80.0
    );
  }

  Widget quoteBody(){
    String quote = "Live as if you were to die tomorrow. Learn as if you were to live forever";
    return Text(
      "$quote",
      style: TextStyle(
        fontFamily: "Sanserif",
        color:Colors.white,
        letterSpacing: 1.0,
        fontSize: quote.length > 80 ? 18.0 : 25.0
      ),
      textAlign: TextAlign.center,
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
        'waiting for internet connection...',
        style: TextStyle(
          fontFamily: "Sanserif",
          letterSpacing: 1.5,
          fontSize: 12.0,
          color: Colors.white
        ),
      )
    ],);
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
      animationDuration: Duration(seconds: 11),
      onPressed: (){},
      label: Text(
        '1',
        style: TextStyle(
          color:Colors.white,
        ),
      ),
      color: Colors.red,
    );
  }

  Widget quoteAuthor(){
    return Text(
      'Mahatma Gandhi',
      style: TextStyle(
        fontFamily: "Sanserif",
        letterSpacing: 1.0,
        fontSize: 20.0,
        color:Colors.white70
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var uri = Uri.http('picsum.photos', '/800/1000');
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height/1.2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:NetworkImage(uri.toString()),
          fit:BoxFit.fill
        ),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          quoteIcon(),
          Container(margin: EdgeInsets.only(top:10.0),),
          quoteBody(),
          Container(margin: EdgeInsets.only(top:30.0),),
          quoteAuthor(),
          Container(margin: EdgeInsets.only(top:50.0),),
          favIcon(),
        ],
      )
    );
  }
}