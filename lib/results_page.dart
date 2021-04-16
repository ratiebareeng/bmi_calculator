import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_container.dart';
import 'package:flutter/material.dart';

import 'bottom_button.dart';

const buttonText = 'RE-CALCULATE';

class ResultsPage extends StatelessWidget {
  final Gender gender;
  final String bmiResult, resultText, interpretation;
  ResultsPage(
      {this.gender,
      @required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your Result',
              style: kBigLabelTextStyle,
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: kLabelTextStyle.copyWith(color: Colors.green),
                  ),
                  Text(
                    bmiResult,
                    style: kBigLabelTextStyle.copyWith(fontSize: 100.0),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            gender: gender,
            label: buttonText,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
