import 'package:demo_web_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Logs extends StatelessWidget {
  const Logs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Logs', style: TextStyle(color: white, fontSize: 36))
        ],
      ),
    );
  }
}