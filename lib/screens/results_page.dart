import 'package:bmi_calculator/constants.dart';
import '/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'overweight/normal/underweight',
                        style: kResultsTextStyle,
                      ),
                      Text(
                        '22',
                        style: kBMITextStyle,
                      ),
                      Text(
                        'interpretation',
                        style: kbodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Re-calculate'),
            )
          ],
        ),
      ),
    );
  }
}
