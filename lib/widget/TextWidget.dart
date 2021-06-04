/*
Custon widget for Text
 - text: title of text
 - alignment: alignment of text
 - textColor: color of text
 - fontSize: font size of text
 - fontWeight: font style of text
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitra_tasks/model/Todo.dart';
import 'package:mitra_tasks/util/constants.dart';

class TextWidget extends StatelessWidget {

  final Todo task;
  final TextAlign alignment;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  Color mTextColor = Colors.grey;
  TextDecoration mTextDecoration = TextDecoration.none;

  TextWidget(
      {required this.task,
      this.alignment = TextAlign.start,
      this.textColor = Colors.black,
      this.fontSize = kTextFontSize,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    if (task.completed) {
      mTextColor = Colors.grey;
      mTextDecoration = TextDecoration.lineThrough;
    } else {
      mTextColor = textColor;
      mTextDecoration = TextDecoration.none;
    }
    return Text(
      task.title,
      style: TextStyle(
          fontSize: fontSize,
          color: mTextColor,
          fontWeight: fontWeight,
          decoration: mTextDecoration),
      textAlign: alignment,
    );
  }
}
