import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';

/* 
Custon widget for Text
 - text: title of text
 - alignment: alignment of text
 - textColor: color of text
 - fontSize: font size of text
 - fontWeight: font style of text
 */
class OnBoardTextWidget extends StatelessWidget {
  final String text;
  final TextAlign alignment;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  const OnBoardTextWidget(
      {required this.text,
      this.alignment = TextAlign.center,
      this.textColor = Colors.black,
      this.fontSize = kTextFontSize,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: TextDecoration.none),
      textAlign: alignment,
    );
  }
}

/* 
Custon widget for List View Cell
 - text: title of list cell
 - cellHeight: height of cell
 - cellBGColor: background color of cell
 */
class ListCellWidget extends StatelessWidget {
  final String title;
  final double cellHeight;
  final Color cellBGColor;
  const ListCellWidget(this.title, this.cellHeight, this.cellBGColor);

  @override
  Widget build(BuildContext context) {
// getting cell width as screen width
    double cellWidth = MediaQuery.of(context).size.width;
    return Container(
      height: cellHeight,
      width: cellWidth,
      color: cellBGColor,
      child: Center(
// Using custom text widget
        child: OnBoardTextWidget(
          text: title,
          alignment: TextAlign.left,
          textColor: Colors.white,
          fontSize: kTextFontSize,
        ),
      ),
    );
  }
}
