import 'package:demo_web_app/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyChart extends StatelessWidget {
  const MonthlyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width; 

    return LayoutBuilder(builder: (context, constraints) {
        if (screenSize < 500) {
          return Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            height: 230,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 1,
                maxX: 6,
                minY: 1,
                maxY: 10,
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    drawBehindEverything: false
                  ),
                  rightTitles: AxisTitles(
                    drawBehindEverything: false
                  )
                ),
                lineBarsData: [
                  LineChartBarData(
                    color: white,
                    belowBarData: BarAreaData(
                      show: true,
                      color: grey.withOpacity(0.5)
                    ),
                    isCurved: true,
                    spots: const [
                      FlSpot(1, 5),
                      FlSpot(2, 4),
                      FlSpot(3, 5),
                      FlSpot(4, 6),
                      FlSpot(5, 5),
                      FlSpot(6, 3),
                    ]
                  )
                ]
              )
            ),
          );
        }
        else {
          return Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            height: 230,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 1,
                maxX: 12,
                minY: 1,
                maxY: 10,
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    drawBehindEverything: false
                  ),
                  rightTitles: AxisTitles(
                    drawBehindEverything: false
                  )
                ),
                lineBarsData: [
                  LineChartBarData(
                    color: white,
                    belowBarData: BarAreaData(
                      show: true,
                      color: grey.withOpacity(0.5)
                    ),
                    isCurved: true,
                    spots: const [
                      FlSpot(1, 3),
                      FlSpot(2, 5),
                      FlSpot(3, 4),
                      FlSpot(4, 7),
                      FlSpot(5, 6),
                      FlSpot(6, 3),
                      FlSpot(7, 5),
                      FlSpot(8, 4),
                      FlSpot(9, 5),
                      FlSpot(10, 6),
                      FlSpot(11, 5),
                      FlSpot(12, 3),
                    ]
                  )
                ]
              )
            ),
          );
        }
      }
    );
  }
}
