import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/TextWidget.dart';
import 'package:mitra_tasks/widget/customwidget.dart';
/* Custon widget for fourth page that contains text and image */
class FourthScreen extends StatelessWidget {
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
            OnBoardTextWidget(text: 'There are three navigation levels...'),
            SizedBox(
              height: 150,
            ),
            Image.asset('assets/images/img.png'),
          ],
        ),
      ),
    );
  }
}
