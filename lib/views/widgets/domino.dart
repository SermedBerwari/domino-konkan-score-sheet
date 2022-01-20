import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/domino_provider.dart';

class DominoMethods {
  //=====================================================Score Sheet Method
  Expanded scoreSheetWidget(double colWidth) {
    return Expanded(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: colWidth - 10,
                child:
                    Consumer<DominoProvider>(builder: (context, domino, child) {
                  return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: domino.playerOneCurrentHundreds,
                      itemBuilder: (context, index) {
                        List<String> list;
                        Color? color;
                        if (index + 1 == domino.playerOneCurrentHundreds) {
                          list = domino.playerOneScores;
                        } else {
                          list = domino.finishedScoreList;
                        }

                        return scoreSheetMethod(colWidth, list, color);
                      });
                })),
            const VerticalDivider(
              indent: 0,
              endIndent: 30,
              thickness: 2,
              color: Colors.blue,
              width: 20,
            ),
            SizedBox(
                width: colWidth - 10,
                child:
                    Consumer<DominoProvider>(builder: (context, domino, child) {
                  return ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: domino.playerTwoCurrentHundreds,
                      itemBuilder: (context, index) {
                        List<String> list;
                        Color? color;
                        if (index + 1 == domino.playerTwoCurrentHundreds) {
                          list = domino.playerTwoScores;
                        } else {
                          list = domino.finishedScoreList;
                        }

                        return scoreSheetMethod(colWidth, list, color);
                      });
                })),
          ],
        ),
      ),
    );
  }

  Container scoreSheetMethod(double colWidth, list, color) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                getPoint(colWidth, list[0]),
                getPoint(colWidth, list[1]),
                getPoint(colWidth, list[2]),
                getPoint(colWidth, list[3]),
              ],
            ),
            Row(
              children: [
                getPoint(colWidth, list[4]),
                getPoint(colWidth, list[5]),
                getPoint(colWidth, list[6]),
                getPoint(colWidth, list[7]),
              ],
            ),
            const Divider(
              color: Colors.blue,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  Container getPoint(width, text) {
    return Container(
      width: width / 4.5,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  //=====================================================
  AppBar appBarMethod() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: const Text('Domino Score Sheet'),
      actions: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Consumer<DominoProvider>(
            builder: (context, domino, child) {
              return InkWell(
                onTap: () {
                  domino.initialGame();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        )
      ],
    );
  }

//=====================================================================
  Container playersNameAndPointsWidget(playerOneName, playerTwoName, colWidth) {
    return Container(
        padding: const EdgeInsets.only(top: 5),
        child: Consumer<DominoProvider>(builder: (context, domino, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: colWidth - 40,
                    child: Center(
                        child: Text(
                      playerOneName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
                  ),
                  Container(width: 2, height: 30, color: Colors.blue),
                  SizedBox(
                    width: colWidth - 40,
                    child: Center(
                        child: Text(playerTwoName,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue))),
                  ),
                  const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: colWidth - 40,
                    child: Center(
                        child: Text(
                      '${domino.totalPlyerOnePoints}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
                  ),
                  Container(width: 2, height: 30, color: Colors.blue),
                  SizedBox(
                    width: colWidth - 40,
                    child: Center(
                        child: Text('${domino.totalPlyerTwoPoints}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue))),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  TableRow addPointsPanelWidget(double colWidth) {
    return TableRow(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            addPointButtonMethod(colWidth, 5, '+ 05', 'p1', Colors.red),
            addPointButtonMethod(colWidth, 10, '+ 10', 'p1', Colors.red),
            addPointButtonMethod(colWidth, 20, '+ 20', 'p1', Colors.red),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            addPointButtonMethod(colWidth, 5, '+ 05', 'p2', Colors.blue),
            addPointButtonMethod(colWidth, 10, '+ 10', 'p2', Colors.blue),
            addPointButtonMethod(colWidth, 20, '+ 20', 'p2', Colors.blue),
          ],
        )
      ],
    );
  }

  Container addPointButtonMethod(double colWidth, point, text, player, color) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        width: colWidth / 3.2,
        child: Consumer<DominoProvider>(builder: (context, domino, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
            ),
            onPressed: () {
              domino.addPonits(point, player);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center),
            ),
          );
        }));
  }
}
