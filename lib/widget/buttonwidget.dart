import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/customwidget.dart';
/* 
Custom widget for button with horizontal alignment
 - button title required
 - button style padding is optional 
 */
class HorizontalButtonWidget extends StatelessWidget {
  final String firstButtonTitle;
  final String secondButtonTitle;
  final EdgeInsets padding;
  const HorizontalButtonWidget(
      {required this.firstButtonTitle,
      required this.secondButtonTitle,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
/* Style of button */
    ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: kTextFontSize),
      primary: Colors.white,
      onPrimary: Colors.black,
      side: BorderSide(color: Colors.black, width: 1),
      padding: padding,
    );
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: OnBoardTextWidget(
              text: firstButtonTitle,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: style,
            child: OnBoardTextWidget(
              text: secondButtonTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
