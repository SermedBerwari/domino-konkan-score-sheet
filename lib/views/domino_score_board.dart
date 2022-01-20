import 'package:flutter/material.dart';
import 'widgets/domino.dart';

class DominoScoreBoard extends StatelessWidget {
  final String playerOneName;
  final String playerTwoName;
  const DominoScoreBoard(this.playerOneName, this.playerTwoName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colWidth = 0.5 * (size.width) - 20;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.indigo,
            appBar: DominoMethods().appBarMethod(),
            body: Container(
              margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.indigo),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Column(
                children: [
                  Table(
                    columnWidths: const {
                      0: FractionColumnWidth(0.5),
                      1: FractionColumnWidth(0.5),
                    },
                    children: [
                      DominoMethods().addPointsPanelWidget(colWidth),
                    ],
                  ),
                  DominoMethods()
                      .playersNameAndPointsWidget(playerOneName, playerTwoName,colWidth),
                  const Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                    color: Colors.blue,
                  ),
                  DominoMethods().scoreSheetWidget(colWidth),
                ],
              ),
            )));
  }

//================================Methods===========================

}
