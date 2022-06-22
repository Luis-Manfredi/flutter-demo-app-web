import 'package:demo_web_app/components/custom_card.dart';
import 'package:demo_web_app/components/indicator.dart';
import 'package:demo_web_app/components/monthly_chart.dart';
import 'package:demo_web_app/components/pie_chart.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/data/dashboard_card_data.dart';
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
      height: size.height,
      width: size.width,

      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard', style: TextStyle(color: white, fontSize: 36)),
              const SizedBox(height: 5),
              Text('Brief sight of your tasks and projects.', style: TextStyle(color: grey, fontSize: 18)),

              const SizedBox(height: 20),

              //Cards
              Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.symmetric(vertical: 20),
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

              const SizedBox(height: 20),

              Container(
                width: size.width,
                padding: const EdgeInsets.all(2),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    CustomCard(
                      height: 300, 
                      width: size.width < 850 ? size.width : 700,
                      widget: Column(
                        children: [
                          Text('Monthly Productivity', style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),

                          const MonthlyChart(), 
                        ],
                      ),
                    ),

                    CustomCard(
                      height: size.width < 500 ? 360 : 300, 
                      width: size.width < 850 ? size.width : 400,
                      widget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Time Management', style: TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),

                            LayoutBuilder(builder: (context, constraints) {
                             if (size.width < 500) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CustomPieChart(),

                                  const SizedBox(height: 10),
                                
                                  Column(
                                    children: [
                                      Indicator(color: done, text: 'Project #1'),
                              
                                      const SizedBox(height: 10),
                              
                                      Indicator(color: inProgress, text: 'Project #2'),
                              
                                      const SizedBox(height: 10),
                              
                                      Indicator(color: pending, text: 'Project #3')
                                    ],
                                  )
                                ],
                              );
                             } 
                             else {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomPieChart(),
                                
                                    Column(
                                      children: [
                                        Indicator(color: done, text: 'Project #1'),
                                
                                        const SizedBox(height: 10),
                                
                                        Indicator(color: inProgress, text: 'Project #2'),
                                
                                        const SizedBox(height: 10),
                                
                                        Indicator(color: pending, text: 'Project #3')
                                      ],
                                    )
                                  ],
                                );
                             }
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}