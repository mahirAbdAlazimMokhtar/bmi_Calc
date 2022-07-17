import 'package:bmi_calc/result_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const BmiCal());
}

class BmiCal extends StatelessWidget {
  const BmiCal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Colors.red,
        primarySwatch: Colors.teal,
            canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline1: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),

        ),
      ),

      home: HomePage(),
    );
  }
}
