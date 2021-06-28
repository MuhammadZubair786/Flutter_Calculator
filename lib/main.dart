import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          centerTitle: true,
          title: Text(("Basic Flutter Calculator"),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10, 6),
                      blurRadius: 10.0,
                      color: Colors.red,
                    ),
                  ])),
        ),
        body: Calculator(),
    
      ),
    );
  }
}
