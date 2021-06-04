import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';

/* Custon widget for fifth page that contains text and image */
class FifthScreen extends StatelessWidget {
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
                      text: 'Pinch together vertically ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'to collapse your current level and navigate up.'),
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
