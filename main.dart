

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyCalcul());


class MyCalcul extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }

}

class _Calculator extends State<Calculator>{
  //Variables
  String text = "0";
  double num1 = 0;
  double num2 = 0;
  String res = "";
  String finalRes = "";
  String opr = "";
  String prevOpr = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.right,
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('C', Colors.white, 1),
                button('+/-', Colors.white, 1),
                button('%', Colors.white, 1),
                button('/', Colors.amber, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('7', Colors.grey, 1),
                button('8', Colors.grey, 1),
                button('9', Colors.grey, 1),
                button('x', Colors.amber, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('4', Colors.grey, 1),
                button('5', Colors.grey, 1),
                button('6', Colors.grey, 1),
                button('-', Colors.amber, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('1', Colors.grey, 1),
                button('2', Colors.grey, 1),
                button('3', Colors.grey, 1),
                button('+', Colors.amber ,1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('0', Colors.grey , 0),
                button('.', Colors.grey , 1),
                button('=', Colors.amber , 1),
              ],
            )
          ],
        ),
      ),
    );
  }
// start fonction de creation du button
  Widget button(String btnTxt, Color btnColor, int btnSize){
    Container container;
    if( btnSize == 0){
      container =Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: (){
              calculate(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: btnColor,
            padding: EdgeInsets.only(left: 81, top: 20, right: 81, bottom: 20),
            shape: StadiumBorder(),
          ) );
    } else {
      container = Container(
          padding: EdgeInsets.only(bottom: 10),
          child: RaisedButton(
            onPressed: (){
              calculate(btnTxt);
            },
            child: Text(btnTxt,
                style: TextStyle(
                    fontSize: 30
                )
            ),
            color: btnColor,
            padding: EdgeInsets.all(20),
            shape: CircleBorder(),
          ) );
    }
    return container;
  }
// end function buton
  void calculate(String txt){
    if(txt == 'C'){
      text = "0";
      num1 = 0;
      num2 = 0;
      res = "";
      finalRes = "";
      opr = "";
      prevOpr = "";
    } else if(opr == "=" && txt == "="){

      switch(prevOpr){
        case "+":
          finalRes = add();
          break;
        case "-":
          finalRes = sub();
          break;
        case "x":
          finalRes = mul();
          break;
        case "/":
          final res = div();
          break;
      }

    } else if(txt == "+" || txt == "-" || txt == "x" || txt == "/" || txt == "="){
      if(num1 == 0){
        num1 = double.parse(res);
      } else {
        num2 = double.parse(res);
      }

      switch(opr){
        case "+":
          finalRes = add();
          break;
        case "-":
          finalRes = sub();
          break;
        case "x":
          finalRes = mul();
          break;
        case "/":
          finalRes = div();
          break;
      }
      prevOpr = opr;
      opr = txt;
      res = "";
    } else {
      res = res + txt;
      finalRes = res;
    }
    setState(() {
      text = finalRes;
    });
  }
  String add(){
      res = (num1 + num2).toString();
      num1 = double.parse(res);
      return res;
  }
  String sub(){
    res = (num1 - num2).toString();
    num1 = double.parse(res);
    return res;
  }
  String mul(){
    res = (num1 * num2).toString();
    num1 = double.parse(res);
    return res;
  }
  String div(){
    res = (num1 / num2).toString();
    num1 = double.parse(res);
    return res;
  }
}


