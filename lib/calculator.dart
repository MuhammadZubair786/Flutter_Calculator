import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  String result = '';
  String inp = "";

  Widget btn(var btntx) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.248,
        child: ElevatedButton(
          onPressed: () {
            input(btntx);
          },
          child: Text(("$btntx"),
             style: TextStyle(fontSize: 30, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
              primary: Colors.black54,
              onPrimary: Colors.white,
              side: BorderSide(color: Colors.white, width: 1),
              shadowColor: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
        ));
  }

  Widget opbtn(var btntx) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.248,
        child: ElevatedButton(
          onPressed: () {
            input(btntx);
          },
          child: Text(("$btntx"),
              style: TextStyle(fontSize: 45, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
              primary: Color(0xff5564F3),
              onPrimary: Colors.white,
              side: BorderSide(color: Colors.white, width: 1),
              shadowColor: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
        ));
  }

  // Widget equal(){
  //   return (

  //   );
  // }

  square() {
    Parser pChange = Parser();
    Expression exp = pChange.parse(inp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    

    eval = eval * eval;
    setState(() {
      inp="$inp*$inp".toString();
      result = eval.toString();
    });
  }

  sqrroot() {
    Parser pChange = Parser();
    Expression exp = pChange.parse(inp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    eval = sqrt(eval);
    setState(() {
       inp="√$inp".toString();
      result = eval.toString();
    });
  }

  bclear() {
    setState(() {
      inp = inp.substring(0, result.length - 1);
    });
  }

  input(var btntx) {
    setState(() {
      inp = inp + btntx;
    });
  }

  clear() {
    setState(() {
      inp = "";
      result = "";
    });
  }

  equal() {
    Parser pChange = Parser();
    Expression exp = pChange.parse(inp);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white10,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height:MediaQuery.of(context).size.height*0.1),
          
          Row(children: [
           
            Padding(padding: EdgeInsets.only(left: 10)),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.93,
                alignment: Alignment.centerRight,
                child: Text(
                  "$inp",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ]),

           
        
          Row(children: [
            Padding(padding: EdgeInsets.only(left: 10,top: 50)),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.93,
                alignment: Alignment.centerRight,
                child: Text(
                  "$result",
                  style: TextStyle(
                    fontSize: 50,
                  
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ]), SizedBox(height:MediaQuery.of(context).size.height*0.1),


         
                   Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.248,
                child: ElevatedButton(
                  onPressed: square,
                  child: Text(("x^2"),
                    style: TextStyle(fontSize: 30, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shadowColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                )),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.248,
                child: ElevatedButton(
                  onPressed: sqrroot,
                  child: Text(("√x"),
                      style: TextStyle(fontSize: 30, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shadowColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                )),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.248,
                child: ElevatedButton(
                  onPressed: bclear,
                  child: Text(("⌫"),
                       style: TextStyle(fontSize: 35, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shadowColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                )),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.248,
                child: ElevatedButton(
                  onPressed: clear,
                  child: Text(("C"),
                      style: TextStyle(fontSize: 35, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shadowColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                ))
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("7"), btn("8"), btn("9"), opbtn("/")]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("4"), btn("5"), btn("6"), opbtn("*")]),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("1"), btn("2"), btn("3"), opbtn("-")]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            btn("."),
            btn("0"),
            Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.248,
                child: ElevatedButton(
                  onPressed: equal,
                  child: Text(("="),
                      style: TextStyle(fontSize: 45, fontFamily: 'Raleway',fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shadowColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                )),
            opbtn("+")
          ])
        ],
      ),
    ));
  }
}
