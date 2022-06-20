import 'package:demo_web_app/components/custom_card.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/data/dashboard_card_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    returnStatusColor(String status){
      if (status == 'DONE') {
        return done;
      }
      else if (status == 'IN PROGRESS') {
        return inProgress;
      }
      else {
        return pending;
      }
    }

    Widget cardBuilder(int index) {
      return CustomCard(
        height: 180, 
        width: 300,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cardDataList[index].taskName, style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cardDataList[index].description, style: TextStyle(color: white)),
                const SizedBox(height: 10),
                Text(cardDataList[index].date, style: TextStyle(color: ochre))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: returnStatusColor(cardDataList[index].status),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text(cardDataList[index].status, style: TextStyle(fontSize: 12, color: white)),
                ),
              ],
            )
          ],
        )
      );
    }

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
            const SizedBox(height: 5),
            Text('Brief sight of your tasks and projects.', style: TextStyle(color: grey, fontSize: 18)),
      
            //Cards
            Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  cardBuilder(0),
                  cardBuilder(1),
                  cardBuilder(2),
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
                  CustomCard(
                    height: 240, 
                    width: size.width < 850 ? size.width : 700,
                    widget: Column(
                      children: [
                        Text('Monthly Productivity', style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),

                        // LineChart(
                        //   LineChartData(

                        //   )
                        // )
                      ],
                    ),
                  ),
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