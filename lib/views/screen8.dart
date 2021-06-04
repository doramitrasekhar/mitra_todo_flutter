import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/views/todo_list.dart';
import 'package:mitra_tasks/widget/buttonwidget.dart';
import 'package:mitra_tasks/widget/customwidget.dart';

/* Custon widget for eighth page that contains text, image and button */
class EighthScreen extends StatelessWidget {

  ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: kTextFontSize),
    primary: Colors.white,
    onPrimary: Colors.black,
    side: BorderSide(color: Colors.black, width: 1),
    padding: EdgeInsets.only(top: 10, left: 55, bottom: 10, right: 55),
  );

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
            OnBoardTextWidget(
                text:
                    'Sign up to the newsletter, and unlock a theme for your lists.'),
            SizedBox(
              height: 0,
            ),
            Image.asset('assets/images/email.png'),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: kNewLineFontSize * 2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/todolist', (Route<dynamic> route) => false);
              },
              style: style,
              child: OnBoardTextWidget(
                text: "CLICK TO HOME",
              ),
            )
          ],
        ),
      ),
    );
  }
}
