import 'package:demo_web_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, 
  required this.function, 
  required this.text, 
  required this.height, 
  required this.width, 
  required this.iconActive, 
  this.icon, 
  required this.backgroundColor, required this.style}) : super(key: key);

  final String text;
  final VoidCallback function;
  final double height;
  final double width;
  final bool iconActive;
  final Widget? icon;
  final Color backgroundColor;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))
          )
        ), 
        child: iconActive ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: style),
            icon!
          ],
        ) : Text(text, style: style)
      ),
    );
  }
}