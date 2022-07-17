import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.result,
      required this.isAge,
      required this.isMale})
      : super(key: key);

  final double result;

  final int isAge;
  final bool isMale;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30) {
      resultText = 'Obese';
    } else if (result > 25 && result < 30) {
      resultText = 'OverWeight';
    } else if (result >= 18.5 && result <= 24.9) {
      resultText = 'Normal';
    } else {
      resultText = 'Thin';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: double.infinity,
            child: Card(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/result.jpeg'),
                  Text('Gender: ${isMale ? 'Male' : 'Female'}',
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Result: ${result.toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Healthiness: $resultPhrase',
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Age: $isAge',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
