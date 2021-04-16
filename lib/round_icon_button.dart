import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onTap,
      fillColor: Color(0xFF4C4F5E),
      elevation: 24.0,
      constraints: const BoxConstraints.tightFor(width: 48.0, height: 48.0),
      shape: CircleBorder(),
    );
  }
}
