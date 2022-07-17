import 'package:bmi_calc/result_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 170;
  int weight = 55;
  int isAge = 18;
  bool isMale = !true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
      ),
      body: SafeArea(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    buildExpandedGender(context, 'male'),
                    const SizedBox(width: 15),
                    buildExpandedGender(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Neumorphic(
                style: const NeumorphicStyle(
                  color: Colors.blueGrey,

                ),
                //color: Colors.blueGrey,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      const SizedBox(height:15),
                      NeumorphicSlider(
                         style: const SliderStyle(
                           accent: Colors.teal,
                           variant: Colors.white
                         ),
                          min: 60,
                          max: 220,
                          value: height,
                          onChanged: (value) => setState(() {
                                height = value;
                              }))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    buildExpandedHeightAndAge(context, 'weight'),
                    const SizedBox(width: 15),
                    buildExpandedHeightAndAge(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(

              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: NeumorphicButton(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    border: const NeumorphicBorder(
                      isEnabled: true
                    )),
                onPressed: () {
                  var result = weight / pow(height / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ResultPage(
                        result: result, isAge: isAge, isMale: isMale);
                  }));
                },
                child: Text(
                  textAlign: TextAlign.center,
                  'Calculate',style: Theme.of(context).textTheme.headline2,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedGender(BuildContext context, String gender) {
    return Expanded(
      child: NeumorphicButton(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
        onPressed: () {
          setState(() {
            isMale = gender == 'male' ? true : false;
          });
        },
        child: Card(
          color: isMale && gender == 'male' || !isMale && gender == 'female'
              ? Colors.white
              : Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gender == 'male'
                  ? Image.asset(
                      'assets/images/male.png',
                      height: 150,
                    )
                  : Image.asset(
                      'assets/images/female1.png',
                      height: 150,
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(
                gender == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildExpandedHeightAndAge(BuildContext context, String age) {
    return Expanded(
      child: Neumorphic(
        style: NeumorphicStyle(
          color: Colors.blueGrey.shade500,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              age == 'age' ? 'Age' : 'weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              age == 'age' ? '$isAge' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: age == 'age' ? 'age++' : 'weight++',
                    onPressed: () {
                      setState(() {
                        age == 'age' ? isAge++ : weight++;
                      });
                    },
                    child:  	NeumorphicIcon(Icons.add,size: 40,),
                  ),
                  const SizedBox(width: 15),
                  FloatingActionButton(
                    heroTag: age == 'age' ? 'age--' : 'weight--',
                    onPressed: () {
                      setState(() {
                        age == 'age' ? isAge-- : weight--;
                      });
                    },
                    child:  NeumorphicIcon(Icons.remove
                    ,size: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
