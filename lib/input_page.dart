import 'package:flutter/material.dart';
import 'gender_card_contents.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80;
const Color activeCardColour = Color(0xFFFFE0B2); //orange[100]
const Color inactiveCardColour = Color(0xffFFECB3); //amber[100]
const Color bottomContainerColour = Color(0xFF6002EE); //purple[500]
// final Color bottomContainerColour = Theme.of(context).colorScheme.secondary;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  void updateColour(String gender) {
    if (gender == 'male') {
      debugPrint('Male card was tapped');
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
        debugPrint('Male card is now active');
      } else {
        maleCardColour = inactiveCardColour;
        debugPrint('Male card is now inactive');
      }
    }

    if (gender == 'female') {
      debugPrint('Female card was tapped');
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
        debugPrint('Female card is now active');
      } else {
        femaleCardColour = inactiveCardColour;
        debugPrint('Female card is now inactive');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Color bottomContainerColour = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        // onTap: () => (debugPrint('Male card was tapped')),
                        onTap: () {
                          setState(() {
                            updateColour('male');
                          });
                        },
                        child: ReusableCard(
                          colour: maleCardColour,
                          cardChild: GenderCardContents(
                            icon: Icons.male,
                            label: 'Male',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateColour('female');
                          });
                        },
                        child: ReusableCard(
                          colour: femaleCardColour,
                          cardChild: GenderCardContents(
                            icon: Icons.female,
                            label: 'Female',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColour,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: activeCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: activeCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: bottomContainerColour,
                margin: EdgeInsets.only(top: 16),
                width: double.infinity,
                height: bottomContainerHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
