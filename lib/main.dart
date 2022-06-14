import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/screens/login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: ochre,
        backgroundColor: black,
        highlightColor: Colors.transparent,
        splashColor: grey,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ochre
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.dark, 
          primary: ochre, 
          onPrimary: ochre, 
          secondary: grey, 
          onSecondary: grey, 
          error: Colors.red, 
          onError: Colors.red, 
          background: black, 
          onBackground: black, 
          surface: grey, 
          onSurface: grey)
      ),
      home: const Login(),
    );
  }
}