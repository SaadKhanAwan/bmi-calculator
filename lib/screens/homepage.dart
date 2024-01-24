import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/providers/age_provider.dart';
import 'package:bmi_calculator/providers/gender_provider.dart';
import 'package:bmi_calculator/providers/slider_provider.dart';
import 'package:bmi_calculator/providers/weight_provider.dart';
import 'package:bmi_calculator/screens/result_Sreen.dart';
import 'package:bmi_calculator/widget/icon_Screen.dart';
import 'package:bmi_calculator/widget/icon_button.dart';
import 'package:bmi_calculator/widget/reuseable_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

bool forcolor = true;

// enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final provider = Provider.of<GenderColor>(context, listen: false);
    final provider2 = Provider.of<AgeCalculation>(context, listen: false);
    final provider3 = Provider.of<WeightCalculation>(context, listen: false);
    final provider4 = Provider.of<Slidervalue>(context, listen: false);

    Brain brain =
        Brain(height: provider4.currentvalue, weight: provider3.weight);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Consumer<GenderColor>(builder: (context, value, child) {
                  return Reuseable(
                      ontab: () {
                        provider.setSelectedGender(Gender.male);
                      },
                      colour: provider.getMaleColor(activeColor, inactivecolor),
                      cardchild: IconWidget(
                        myText: "Male".toUpperCase(),
                        myicon: FontAwesomeIcons.mars,
                      ));
                }),
                Consumer<GenderColor>(builder: (context, value, child) {
                  return Reuseable(
                      ontab: () {
                        provider.setSelectedGender(Gender.female);
                      },
                      colour:
                          provider.getFemaleColor(activeColor, inactivecolor),
                      cardchild: IconWidget(
                        myText: "Female".toUpperCase(),
                        myicon: FontAwesomeIcons.venus,
                      ));
                }),
              ],
            ),
          ),
          Reuseable(
              colour: activeColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Consumer<Slidervalue>(builder: (context, value, child) {
                        return Text(
                          provider4.currentvalue.toString(),
                          style: labelTextStyle2,
                        );
                      }),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Consumer<Slidervalue>(builder: (context, value, child) {
                    return SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: const Color(0XFFFFFFFF),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0XFFEB1555),
                          overlayColor: Colors.grey,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: provider4.currentvalue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          provider4.changevalue(value);
                        },
                      ),
                    );
                  })
                ],
              )),
          Expanded(
            child: Row(
              children: [
                Reuseable(
                    colour: activeColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Consumer<WeightCalculation>(
                            builder: (context, value, child) {
                          return Text(provider3.weight.toString(),
                              style: labelTextStyle2);
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIConButton(
                              myicon: Icons.remove,
                              ontab: () {
                                provider3.subtractweight();
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyIConButton(
                              myicon: Icons.add,
                              ontab: () {
                                provider3.addweight();
                              },
                            )
                          ],
                        )
                      ],
                    )),
                Reuseable(
                    colour: activeColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Consumer<AgeCalculation>(
                            builder: (context, child, value) {
                          return Text(provider2.age.toString(),
                              style: labelTextStyle2);
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIConButton(
                                myicon: Icons.remove,
                                ontab: () {
                                  provider2.subtractage();
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            MyIConButton(
                              myicon: Icons.add,
                              ontab: () {
                                provider2.addage();
                              },
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                          bMI: brain.calculateBMI(),
                          comments: brain.getResult(),
                          suggestion: brain.getNotaition())));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: bottonbuttonheight,
              width: double.infinity,
              color: bottomcolor,
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: labelTextStyle3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
