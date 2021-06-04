import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';

/* Custon widget for sixth page that contains text and image */
class SixthScreen extends StatelessWidget {
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
                      text: 'Tap on a list ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'to see its content.'),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Tap on a list title ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'to edit it....'),
                ],
              ),
            ),
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
