import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/widget/reuseable_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String comments;
  final String bMI;
  final String suggestion;

  const ResultScreen(
      {super.key,
      required this.comments,
      required this.bMI,
      required this.suggestion});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
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
                    widget.comments,
                    style: resultlabel,
                  ),
                  Text(
                    widget.bMI,
                    style: resultnumber,
                  ),
                  Text(
                    widget.suggestion,
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
