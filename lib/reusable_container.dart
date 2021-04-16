import 'package:flutter/material.dart';

// conatiner for grouping data
class ReusableContainer extends StatelessWidget {
  ReusableContainer(
      {@required this.colour, @required this.cardChild, this.cardTap});

  final Color colour; // container bg colour
  final Widget cardChild; // container child widget
  final Function cardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
