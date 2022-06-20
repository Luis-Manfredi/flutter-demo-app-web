import 'package:demo_web_app/components/custom_drawer.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/data/user_data.dart';
import 'package:demo_web_app/screens/dashboard.dart';
import 'package:demo_web_app/screens/logs.dart';
import 'package:demo_web_app/screens/settings.dart';
import 'package:demo_web_app/screens/tasks.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  int index = 0;

  List<NavigationRailDestination> destinations = const [
    NavigationRailDestination(icon: Icon(Icons.dashboard, size: 40), label: Text('Dashboard')),
    NavigationRailDestination(icon: Icon(Icons.add_task_rounded, size: 40), label: Text('Tasks')),
    NavigationRailDestination(icon: Icon(Icons.notes_rounded, size: 40), label: Text('Logs')),
    NavigationRailDestination(icon: Icon(Icons.settings_applications_sharp, size: 40), label: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: size.width < 850 ? true : false,
        iconTheme: IconThemeData(
          color: black
        ),
        backgroundColor: ochre,
        title: Text('Logo', style: TextStyle(color: black, fontSize: 24)),

        actions: [

          size.width < 500 
          ? Center(child: Text(username.isEmpty ? 'User' : username, style: TextStyle(color: white, fontSize: 20))) 
          : Center(child: Text(username.isEmpty ? 'Welcome, user!' : 'Welcome, $username!', style: TextStyle(color: white, fontSize: 20))),

          const SizedBox(width: 30),

          PopupMenuButton(
            padding: EdgeInsets.zero,
            icon: CircleAvatar(
              backgroundColor: black,
              radius: 22,
              child: Icon(Icons.person, color: ochre)
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 60,
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logout', style: TextStyle(color: ochre)),
                    const SizedBox(width: 20),
                    Icon(Icons.logout_rounded, color: ochre)
                  ],
                )
              ),

              PopupMenuItem(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Close', style: TextStyle(color: ochre)),
                    const SizedBox(width: 20),
                    Icon(Icons.close, color: ochre)
                  ],
                )
              )
            ]
          ),

          const SizedBox(width: 20)
        ],
        toolbarHeight: 60,
      ),

      backgroundColor: white,

      drawer: size.width < 850 ? CustomDrawer(
        destinations: destinations, index: index, function: (index) => setState(() => this.index = index)) : null,

      body: Container(
        color: black.withOpacity(0.95),
        child: Row(
          children: [

            if (size.width > 850)
              NavigationRail(
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
                onDestinationSelected: (index) => setState(() => this.index = index),
              ),

            Expanded(child: buildPages())
          ],
        ),
      ),

    );
  }

  Widget buildPages(){
    switch (index) {
      case 0:
        return const Dashboard();
      case 1: 
        return const Tasks();
      case 2: 
        return const Logs();
      case 3:
        return const Settings();
      default:
        return const Dashboard(); 
    }
  }
}