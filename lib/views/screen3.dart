import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/TextWidget.dart';
import 'package:mitra_tasks/widget/customwidget.dart';
/* Custon widget for third page that contains text and image */
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top * 3;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: topPadding, left: kSidePadding, right: kSidePadding),
        child: Column(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Tap and hold ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'to pick an item up.'),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            OnBoardTextWidget(text: 'Drag it up or down to change its priority.'),
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/img.png'),
          ],
        ),
      ),
    );
  }
}
