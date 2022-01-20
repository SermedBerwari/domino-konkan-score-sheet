import 'package:flutter/material.dart';
import './widgets/konkan.dart';

class KonKanScoreBoard extends StatelessWidget {
  final String playerOneName;
  final String playerTwoName;
  final String rounds;
  const KonKanScoreBoard(this.playerOneName, this.playerTwoName, this.rounds,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.red[900],
        appBar: KonKanMethods().appBarMethod(),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.red[900]!),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              //====== Top Layer
              Row(),
              //====== Names Layer
              KonKanMethods()
                  .playerNamesMethod(playerOneName, playerTwoName, size),
              KonKanMethods().pointsTableMethod(rounds)
            ],
          ),
        ));
  }
}
