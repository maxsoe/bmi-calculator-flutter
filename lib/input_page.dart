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

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
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
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                            debugPrint('$selectedGender pressed');
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: GenderCardContents(
                          icon: Icons.male,
                          label: 'Male',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                            debugPrint('$selectedGender pressed');
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? activeCardColour
                            : inactiveCardColour,
                        cardChild: GenderCardContents(
                          icon: Icons.female,
                          label: 'Female',
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
