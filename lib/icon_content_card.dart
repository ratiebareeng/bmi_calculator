import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContentCard extends StatelessWidget {
  const IconContentCard({
    @required this.cardIcon,
    @required this.cardTitle,
  });

  final IconData cardIcon;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: iconSize,
        ),
        SizedBox(
          height: kStandardDp,
        ),
        Text(
          cardTitle,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
