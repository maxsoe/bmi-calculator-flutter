import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'gender_card_contents.dart';
import 'reusable_card.dart';

import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 35;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            ? kActiveCardColour
                            : kInactiveCardColour,
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
                            ? kActiveCardColour
                            : kInactiveCardColour,
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
                  colour: kActiveCardColour,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            // thumbColor: Color(0xFFFFEB3B),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            overlayColor: Colors.yellow.withOpacity(0.5),
                            activeTickMarkColor: Colors.pink,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: kMinHeight,
                            max: kMaxHeight,
                            divisions: 30,
                            // activeColor:
                            //     Theme.of(context).colorScheme.secondary,
                            onChanged: (double newHeight) {
                              setState(() {
                                height = newHeight.round();
                              });
                            },
                          ),
                        )
                      ]),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: (16),
                                  ),
                                  RoundIconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      }),
                                ],
                              )
                            ]),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  RoundIconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/results');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultsPage()),
                    );
                  },
                  child: Text('Calculate'),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top: 16),
                width: double.infinity,
                height: kBottomContainerHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
