import 'package:bmi_calculator/providers/age_provider.dart';
import 'package:bmi_calculator/providers/gender_provider.dart';
import 'package:bmi_calculator/providers/slider_provider.dart';
import 'package:bmi_calculator/providers/weight_provider.dart';
import 'package:bmi_calculator/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GenderColor()),
        ChangeNotifierProvider(create: (context) => WeightCalculation()),
        ChangeNotifierProvider(create: (context) => AgeCalculation()),
        ChangeNotifierProvider(create: (context) => Slidervalue()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // this is for background color
          scaffoldBackgroundColor: const Color(0XFF0A0E21),
          // this is for app bar color
          appBarTheme: const AppBarTheme(
            color: Color(0XFF0A0E21),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
