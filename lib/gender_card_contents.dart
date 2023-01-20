import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 24);

class GenderCardContents extends StatelessWidget {
  final IconData icon;
  final String label;

  GenderCardContents({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon, //Icons.male
          size: 96,
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}
