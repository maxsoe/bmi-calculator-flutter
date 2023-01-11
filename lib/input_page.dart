import 'package:flutter/material.dart';

const double bottomContainerHeight = 80;
const Color activeCardColour = Color(0xFFFFE0B2); //orange[100]
const Color bottomContainerColour = Color(0xFF6002EE); //purple[500]
// final Color bottomContainerColour = Theme.of(context).colorScheme.secondary;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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

class ReusableCard extends StatelessWidget {
  final Color colour;

  ReusableCard({@required this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)), color: colour),
      child: Center(
        child: Text('text'),
      ),
    );
  }
}
