import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../controllers/konkan_four_provider.dart';

class KonKan4Methods {
  //=====================================================
  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Colors.pink,
      elevation: 0,
      title: const Text('KonKan Score Sheet'),
      centerTitle: true,
      actions: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Consumer<KonkanFourProvider>(
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
  Container playerNamesMethod(
      playerOneName, playerTwoName, playerThreeName, playerFourName, size) {
    var colWidth = 0.25 * (size.width) - 20;
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
            width: colWidth - 20,
            child: Center(
                child: Text(
              playerOneName,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            )),
          ),
          Container(width: 2, height: 30, color: Colors.blue),
          SizedBox(
            width: colWidth - 20,
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
          Container(width: 2, height: 30, color: Colors.blue),
          const Icon(
            Icons.person,
            color: Colors.green,
          ),
          SizedBox(
            width: colWidth - 20,
            child: Center(
                child: Text(
              playerThreeName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            )),
          ),
          Container(width: 2, height: 30, color: Colors.blue),
          SizedBox(
            width: colWidth - 20,
            child: Center(
                child: Text(playerFourName,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo))),
          ),
          const Icon(
            Icons.person,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }

  //========================= Players Point Table
  Expanded pointsTableMethod(
      rounds, playerOneName, playerTwoName, playerThreeName, playerFourName) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(child:
            Consumer<KonkanFourProvider>(builder: (context, konkan, child) {
          return Table(
            columnWidths: const {
              0: FractionColumnWidth(0.1),
              1: FractionColumnWidth(0.2),
              2: FractionColumnWidth(0.2),
              3: FractionColumnWidth(0.2),
              4: FractionColumnWidth(0.2),
              5: FractionColumnWidth(0.1),
            },
            border: TableBorder.symmetric(
                inside: const BorderSide(width: 1, color: Colors.blue),
                outside: const BorderSide(width: 3)),
            children: [
              TableRow(children: [
                topTableCellMethod(Colors.black, Icons.format_list_numbered),
                topTableCellMethod(Colors.red, Icons.person),
                topTableCellMethod(Colors.blue, Icons.person),
                topTableCellMethod(Colors.black, Icons.person),
                topTableCellMethod(Colors.black, Icons.person),
                topTableCellMethod(
                    Colors.black, Icons.add_circle_outline_rounded),
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
                  tableCellMethod(
                      konkan.roundsPoints.isNotEmpty
                          ? konkan.roundsPoints.length < i + 1
                              ? ""
                              : konkan.roundsPoints[i]['p2']
                          : "",
                      Colors.white),
                  tableCellMethod(
                      konkan.roundsPoints.isNotEmpty
                          ? konkan.roundsPoints.length < i + 1
                              ? ""
                              : konkan.roundsPoints[i]['p3']
                          : "",
                      Colors.white),
                  tableCellMethod(
                      konkan.roundsPoints.isNotEmpty
                          ? konkan.roundsPoints.length < i + 1
                              ? ""
                              : konkan.roundsPoints[i]['p4']
                          : "",
                      Colors.white),
                  InkWell(
                    onTap: () {
                      _showAddPoints(
                          konkan,
                          context,
                          i,
                          int.parse(rounds),
                          playerOneName,
                          playerTwoName,
                          playerThreeName,
                          playerFourName);
                    },
                    child: konkan.roundsPoints.isNotEmpty
                        ? konkan.roundsPoints.length != i
                            ? tableCellMethod('', Colors.blue[100])
                            : tableCellMethod('+', Colors.blue[100])
                        : i == 0
                            ? tableCellMethod('+', Colors.blue[100])
                            : tableCellMethod('', Colors.blue[100]),
                  ),
                ]),
              TableRow(children: [
                tableCellMethod('', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeOneTotalPoints}', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeTwoTotalPoints}', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeThreeTotalPoints}', Colors.blue[100]),
                tableCellMethod(
                    '${konkan.playeFourTotalPoints}', Colors.blue[100]),
                tableCellMethod('', Colors.blue[100]),
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
  //=================================== Tabe Cell ===========================
  Container topTableCellMethod(color, icon) => Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.blue[100],
      child: Center(
        child: Icon(
          icon,
          color: color,
        ),
      ));

  //===================================Show Dialog Add Points ===============
  _showAddPoints(konkan, context, i, rounds, p1, p2, p3, p4) {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController _p1 = TextEditingController();
          TextEditingController _p2 = TextEditingController();
          TextEditingController _p3 = TextEditingController();
          TextEditingController _p4 = TextEditingController();
          return AlertDialog(
            title: const Text(
              'Add Points',
              textAlign: TextAlign.center,
            ),
            content: SizedBox(
                height: 250,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(p1),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(p2),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(p3),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(p4),
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
                          controller: _p3,
                        )),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(child: TextField(controller: _p4)),
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
                          var p3 = _p3.text;
                          var p4 = _p4.text;
                          if (konkan.roundsPoints.isNotEmpty) {
                            if (konkan.roundsPoints.length == i) {
                              konkan.addPoints(p1, p2, p3, p4, i + 1, rounds);
                            }
                          } else {
                            if (i == 0) {
                              konkan.addPoints(p1, p2, p3, p4, i + 1, rounds);
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
