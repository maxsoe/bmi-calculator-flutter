import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.icon,
    @required this.onPressed,
  });

  final Icon icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      onPressed: onPressed,
      // shape: CircleBorder(side: BorderSide(color: Colors.black)),
      shape: CircleBorder(),
      constraints:
          BoxConstraints.tightFor(width: kSpacing * 7, height: kSpacing * 7),
      fillColor: Color.fromARGB(255, 241, 246, 204),
      child: icon,
    );
  }
}
