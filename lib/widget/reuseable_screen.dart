import 'package:flutter/material.dart';

class Reuseable extends StatefulWidget {
  const Reuseable(
      {super.key, required this.colour, this.cardchild, this.ontab});

  final Color colour;
  final Widget? cardchild;
  final VoidCallback? ontab;

  @override
  State<Reuseable> createState() => _ReuseableState();
}

class _ReuseableState extends State<Reuseable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: widget.ontab,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: widget.colour, borderRadius: BorderRadius.circular(10)),
        child: widget.cardchild,
      ),
    ));
  }
}
