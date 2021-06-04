import 'package:flutter/material.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/views/screen1.dart';
import 'package:mitra_tasks/views/screen2.dart';
import 'package:mitra_tasks/views/screen3.dart';
import 'package:mitra_tasks/views/screen4.dart';
import 'package:mitra_tasks/views/screen5.dart';
import 'package:mitra_tasks/views/screen6.dart';
import 'package:mitra_tasks/views/screen7.dart';
import 'package:mitra_tasks/views/screen8.dart';
import 'package:mitra_tasks/widget/dotsindicator.dart';

/* 
Custon widget for page view
 - controller: page controller reference
 */
class MyPageView extends StatelessWidget {

  static const String id = 'MyPageView';

  final PageController controller;

  MyPageView({required this.controller});

  /// array list of pages
  final List<Widget> pages = <Widget>[
    WelcomeScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen(),
    FifthScreen(),
    SixthScreen(),
    SeventhScreen(),
    EighthScreen()
  ];

  /// constant for animation duration
  static const _kDuration = const Duration(milliseconds: 300);

  /// constant for curve
  static const _kCurve = Curves.ease;

/* Custon widget return stack of page view and dot indicator */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: pages.length,
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return pages[index % pages.length];
            },
          ),
          Positioned(
            left: kSidePadding,
            right: kSidePadding,
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Center(
                child: DotsIndicator(
                  controller: controller,
                  itemCount: pages.length,
                  onPageSelected: (int page) {
                    controller.animateToPage(page,
                        duration: _kDuration, curve: _kCurve);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
