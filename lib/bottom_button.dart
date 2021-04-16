import 'package:flutter/material.dart';

import 'constants.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    this.gender,
    this.label,
    this.onTap,
  });

  final Gender gender;
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(label,
              style: kBigLabelTextStyle.copyWith(
                fontSize: 32.0,
              )),
        ),
        color: gender == Gender.male
            ? kActiveMaleSliderColor
            : kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
