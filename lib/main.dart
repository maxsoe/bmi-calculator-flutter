import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.green,
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(
            secondary: Colors.green[900],
            // onPrimary: Colors.orange[900],
          ),
          scaffoldBackgroundColor: Colors.orange[50],
          iconTheme: IconThemeData(color: Colors.orange[900]),
          textTheme:
              TextTheme(bodyText2: TextStyle(color: Colors.orange[900]))),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/results': (context) => ResultsPage(),
      // },
    );
  }
}
