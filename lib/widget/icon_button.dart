import 'package:flutter/material.dart';

class MyIConButton extends StatelessWidget {
  const MyIConButton({super.key, required this.myicon, this.ontab});

  final IconData myicon;
  final VoidCallback? ontab;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.white,
      onPressed: ontab,
      icon: Icon(myicon),
      style: IconButton.styleFrom(
          elevation: 0.0,
          shape: const CircleBorder(),
          backgroundColor: const Color(0XFF4C4F5E)),
    );
  }
}
