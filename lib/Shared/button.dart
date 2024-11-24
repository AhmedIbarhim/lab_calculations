import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/colors.dart';
import 'package:lab_calculations/Shared/text.dart';

class BuildButton extends StatelessWidget {
  var height;
  var width;
  var text;
  var function;
  Color? color;

  BuildButton(
      {required this.height,
      required this.width,
      required this.text,
      required this.function,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(
          onPressed: function,
          child: BuildText(text: text, color: Colors.white),
          color: color ?? AppColors.color1),
    );
  }
}
