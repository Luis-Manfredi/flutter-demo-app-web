import 'package:demo_web_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, required this.destinations, required this.index, required this.function}) : super(key: key);

  final List<NavigationRailDestination> destinations;
  final int index;
  final ValueSetter<int> function;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: black,
      width: 250,
      child: NavigationRail(
        useIndicator: false,
        minExtendedWidth: 250,
        backgroundColor: black,
        selectedIconTheme: IconThemeData(color: white, size: 50),
        unselectedIconTheme: IconThemeData(color: grey, size: 40),
        selectedLabelTextStyle: TextStyle(color: ochre, fontSize: 20, fontWeight: FontWeight.bold),
        unselectedLabelTextStyle: TextStyle(color: white, fontSize: 18),
        elevation: 2,
        extended: true,
        destinations: destinations, 
        selectedIndex: index,
        onDestinationSelected: function,
      ),
    );
  }
}