import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_content_card.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/reusable_container.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_button.dart';

final male = 'MALE';
final female = 'FEMALE';
final heighText = 'HEIGHT';
final weightText = 'WEIGHT';
final ageText = 'AGE';
final calculate = 'CALCULATE';

// gender enum
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 150;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // gender row
              child: Row(
                children: [
                  // Gender card for picking MALE
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender == Gender.male
                              ? gender = null
                              : gender = Gender.male;
                        });
                      },
                      child: ReusableContainer(
                        cardTap: () {
                          setState(() {
                            gender == Gender.male
                                ? gender = null
                                : gender = Gender.male;
                          });
                        },
                        colour: gender == Gender.male
                            ? kActiveMaleColor
                            : kInactiveGenderColor,
                        cardChild: IconContentCard(
                          cardIcon: FontAwesomeIcons.mars,
                          cardTitle: male,
                        ),
                      ),
                    ),
                  ),
                  // Gender card for picking FEMALE
                  Expanded(
                    child: ReusableContainer(
                      cardTap: () {
                        setState(() {
                          gender == Gender.female
                              ? gender = null
                              : gender = Gender.female;
                        });
                      },
                      colour: gender == Gender.female
                          ? kActiveFemaleColor
                          : kInactiveGenderColor,
                      cardChild: IconContentCard(
                        cardIcon: FontAwesomeIcons.venus,
                        cardTitle: female,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // height slider
            Expanded(
              child: ReusableContainer(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      heighText,
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: gender == Gender.male
                            ? kActiveMaleSliderColor
                            : kActiveFemaleSliderColor,
                        overlayColor: gender == Gender.male
                            ? kActiveMaleColor
                            : kActiveFemaleColor,
                        thumbColor: gender == Gender.male
                            ? kActiveMaleSliderColor
                            : kActiveFemaleSliderColor,
                      ),
                      child: Slider(
                          min: 50.0,
                          max: 300.0,
                          value: height.toDouble(),
                          inactiveColor: Colors.grey,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            // weight picker
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      cardTap: null,
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weightText,
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      cardTap: null,
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ageText,
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              gender: gender,
              label: calculate,
              onTap: () {
                // calculate bmi
                BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      gender: gender,
                      bmiResult: bmiBrain.getBmi(),
                      interpretation: bmiBrain.getInterpretation(),
                      resultText: bmiBrain.getTextResult(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
