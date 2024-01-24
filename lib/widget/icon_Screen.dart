// ignore: file_names
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, this.myicon, this.myText});
  final IconData? myicon;
  final String? myText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(myicon, size: 70),
        const SizedBox(
          height: 15,
        ),
        Text(myText!, style: labelTextStyle),
      ],
    );
  }
}
