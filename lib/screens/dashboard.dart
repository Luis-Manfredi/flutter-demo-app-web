import 'package:demo_web_app/components/custom_card.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      height: size.height,
      width: size.width,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: TextStyle(color: white, fontSize: 36)),
      
            //Cards
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: const [
                  CustomCard(height: 180, width: 300),
                  CustomCard(height: 180, width: 300),
                  CustomCard(height: 180, width: 300),
                ],
              ),
            ),

            Container(
              width: size.width,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  CustomCard(height: 240, width: size.width < 850 ? size.width : 700),
                  CustomCard(height: 240, width: size.width < 850 ? size.width : 300)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}