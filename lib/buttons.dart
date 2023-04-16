import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapeed;

  MyButton(
      { this.color,  this.textColor,  required this.buttonText,
       this.buttonTapeed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: buttonTapeed,
      child: ClipRRect(
           borderRadius: BorderRadius.circular(150),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor,fontSize: 35),
              ),
            ),
          ),)
    );
  }
}
