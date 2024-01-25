import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/providers/weight_provider.dart';
import 'package:bmi_calculator/widget/reuseable_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/slider_provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final provider3 = Provider.of<WeightCalculation>(context, listen: true);
    final provider4 = Provider.of<Slidervalue>(context, listen: true);

    Brain brain =
        Brain(height: provider4.currentvalue, weight: provider3.weight);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "Your Result",
              style: labelTextStyle2,
            ),
          ),
          Expanded(
            child: Reuseable(
              colour: activeColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    brain.getResult(),
                    style: resultlabel,
                  ),
                  Text(
                    //here this toStringAsfixed(1) is because of brain class _bmi value is double
                    brain.calculateBMI().toStringAsFixed(1),
                    style: resultnumber,
                  ),
                  Text(
                    brain.getNotaition(),
                    textAlign: TextAlign.center,
                    maxLines: null,
                    style: labelText,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: bottonbuttonheight,
              width: double.infinity,
              color: bottomcolor,
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
                  style: labelTextStyle3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
