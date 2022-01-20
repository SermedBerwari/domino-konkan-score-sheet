import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controllers/konkan_provider.dart';

class KonKanMethods {
  //=====================================================
  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Colors.red[900],
      elevation: 0,
      title: const Text('KonKan Score Sheet'),
      centerTitle: true,
      actions: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Consumer<KonkanProvider>(
            builder: (context, konkan, child) {
              return InkWell(
                onTap: () {
                  konkan.resetPoints();
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

  //=====================================Players Name
  Container playerNamesMethod(playerOneName, playerTwoName, size) {
    var colWidth = 0.5 * (size.width) - 20;
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
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
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
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
    );
  }

  //========================= Players Point Table
  Expanded pointsTableMethod(rounds) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
            child: Consumer<KonkanProvider>(builder: (context, konkan, child) {
          return Table(
            columnWidths: const {
              0: FractionColumnWidth(0.2),
              1: FractionColumnWidth(0.3),
              2: FractionColumnWidth(0.2),
              3: FractionColumnWidth(0.3),
            },
            border: TableBorder.symmetric(
                inside: const BorderSide(width: 1, color: Colors.blue),
                outside: const BorderSide(width: 3)),
            children: [
              TableRow(children: [
                tableCellMethod('Round', Colors.blue[100]),
                tableCellMethod('Team 1', Colors.blue[100]),
                tableCellMethod('Add', Colors.blue[100]),
                tableCellMethod('Team 2', Colors.blue[100]),
              ]),
              for (int i = 0; i <= int.parse(rounds) - 1; i++)
                TableRow(children: [
                  tableCellMethod('${i + 1}', Colors.blue[100]),
                  tableCellMethod(
                      konkan.roundsPoints.isNotEmpty
                          ? konkan.roundsPoints.length < i + 1
                              ? ""
                              : konkan.roundsPoints[i]['p1']
                          : "",
                      Colors.white),
                  InkWell(
                    onTap: () {
                      _showAddPoints(konkan, context, i, int.parse(rounds));
                    },
                    child: konkan.roundsPoints.isNotEmpty
                        ? konkan.roundsPoints.length != i
                            ? tableCellMethod('', Colors.blue[100])
                            : tableCellMethod('+', Colors.blue[100])
                        : i == 0
                            ? tableCellMethod('+', Colors.blue[100])
                            : tableCellMethod('', Colors.blue[100]),
                  ),
                  tableCellMethod(
                      konkan.roundsPoints.isNotEmpty
                          ? konkan.roundsPoints.length < i + 1
                              ? ""
                              : konkan.roundsPoints[i]['p2']
                          : "",
                      Colors.white),
                ]),
              TableRow(children: [
                tableCellMethod('Total', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeOneTotalPoints}', Colors.blue[100]),
                tableCellMethod('', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeTwoTotalPoints}', Colors.blue[100]),
              ]),
            ],
          );
        })),
      ),
    );
  }

  //=================================== Tabe Cell ===========================
  Container tableCellMethod(text, color) => Container(
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      )));

  //===================================Show Dialog Add Points ===============
  _showAddPoints(konkan, context, i, rounds) {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController _p1 = TextEditingController();
          TextEditingController _p2 = TextEditingController();
          return AlertDialog(
            title: const Text(
              'Add Points',
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Team 1'),
                        SizedBox(
                          width: 50,
                        ),
                        Text('Team 2'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9 || x]")),
                          ],
                          controller: _p1,
                        )),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(child: TextField(controller: _p2)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          var p1 = _p1.text;
                          var p2 = _p2.text;
                          if (konkan.roundsPoints.isNotEmpty) {
                            if (konkan.roundsPoints.length == i) {
                              konkan.addPoints(p1, p2, i + 1, rounds);
                            }
                          } else {
                            if (i == 0) {
                              konkan.addPoints(p1, p2, i + 1, rounds);
                            }
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Add'))
                  ],
                )),
          );
        });
  }
}
