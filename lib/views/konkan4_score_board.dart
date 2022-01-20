import 'package:board_games_scores/views/widgets/konkan4.dart';
import 'package:flutter/material.dart';

class KonkanFourScoreSheet extends StatelessWidget {
  final String playerOneName;
  final String playerTwoName;
  final String playerThreeName;
  final String playerFourName;
  final String rounds;
  const KonkanFourScoreSheet(this.playerOneName, this.playerTwoName,
      this.playerThreeName, this.playerFourName, this.rounds,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.pink,
        appBar: KonKan4Methods().appBarMethod(),
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.pink),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              //====== Top Layer
              Row(),
              //====== Names Layer
              KonKan4Methods().playerNamesMethod(playerOneName, playerTwoName,
                  playerThreeName, playerFourName, size),
              KonKan4Methods().pointsTableMethod(rounds, playerOneName,
                  playerTwoName, playerThreeName, playerFourName)
            ],
          ),
        ));
  }
}
