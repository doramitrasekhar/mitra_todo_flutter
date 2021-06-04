import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/buttonwidget.dart';
import 'package:mitra_tasks/widget/customwidget.dart';

/* Custon widget for seventh page that contains image, text and buttons */
class SeventhScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: topPadding, left: kSidePadding, right: kSidePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/cloud.png'),
            SizedBox(
              height: 50,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 40, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(text: 'Use '),
                  TextSpan(
                      text: 'iCloud',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '?'),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            OnBoardTextWidget(
                text:
                    'Storing your lists in iCloud allows you to keep your data in sync across your iPhone, iPad and Mac.'),
            SizedBox(
              height: kNewLineFontSize * 2,
            ),
            HorizontalButtonWidget(
              firstButtonTitle: 'Not Now',
              secondButtonTitle: 'Use iCloud',
              padding: EdgeInsets.all(15),
            ),
          ],
        ),
      ),
    );
  }
}
