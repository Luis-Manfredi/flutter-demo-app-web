import 'package:demo_web_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.color, required this.text}) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //In Progress
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(3))),
        ),

        const SizedBox(width: 5),

        Text(text, style: TextStyle(color: white))
      ],
    );
  }
}
