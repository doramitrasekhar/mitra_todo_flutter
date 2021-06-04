/*
Custon widget for List View Cell
 - text: title of list cell
 - cellHeight: height of cell
 - cellBGColor: background color of cell
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mitra_tasks/model/Todo.dart';
import 'package:mitra_tasks/util/constants.dart';
import 'package:mitra_tasks/widget/TextWidget.dart';

class ListCellWidget extends StatelessWidget {

  final Todo task;
  final double cellHeight;
  final Color cellBGColor;
  Color mBGColor = Colors.black;

  ListCellWidget(this.task, this.cellHeight, this.cellBGColor);

  @override
  Widget build(BuildContext context) {
    double cellWidth = MediaQuery.of(context).size.width;
    if (task.completed) {
      mBGColor = Colors.black;
    } else {
      mBGColor = cellBGColor;
    }
    double topPadding = (cellHeight - kTextFontSize) / 2;
    return Container(
      height: cellHeight,
      width: cellWidth,
        color: mBGColor,
        child: Padding(
          padding: EdgeInsets.only(left: 15,top: topPadding),
          child: TextWidget(
            task: task,
            alignment: TextAlign.left,
            textColor: Colors.white,
            fontSize: kTextFontSize,
          ),
        ));
  }
}
