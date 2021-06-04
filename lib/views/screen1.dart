import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';

/* Custon widget for welcome page that contains texts */
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: TextStyle(fontSize: 30, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Clear',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: kNewLineFontSize,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: kTextFontSize, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Tap or swipe ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'to begin.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
