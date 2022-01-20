import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/konkan_provider.dart';
import '../../controllers/konkan_four_provider.dart';
import '../../controllers/domino_provider.dart';
import '../konkan4_score_board.dart';
import '../konkan_score_board.dart';
import '../domino_score_board.dart';

class HomeWidgetMethods {
  showKonkanFourDialog(context) {
    TextEditingController playerOne = TextEditingController();
    TextEditingController playerTwo = TextEditingController();
    TextEditingController playerThree = TextEditingController();
    TextEditingController playerFour = TextEditingController();
    TextEditingController numberOfRounds = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(hintText: "Player 1"),
                        controller: playerOne,
                      )),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(hintText: "Player 2"),
                        controller: playerTwo,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(hintText: "Player 3"),
                        controller: playerThree,
                      )),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: TextField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(hintText: "Player 4"),
                        controller: playerFour,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration:
                          const InputDecoration(hintText: "Rounds Number"),
                      controller: numberOfRounds,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(child: Consumer<KonkanFourProvider>(
                    builder: (context, konkan4, chile) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        child: const Text('Create Game'),
                        onPressed: () async {
                          if (numberOfRounds.text.isEmpty) {
                            var snackBar = SnackBar(
                              content: const Text(
                                'Number of Rounds Must be more than zero',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.yellow),
                              ),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (int.parse(numberOfRounds.text) <= 0) {
                            var snackBar = SnackBar(
                              content: const Text(
                                'Number of Rounds Must be more than zero',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.yellow),
                              ),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            Navigator.pop(context);
                            await Navigator.push(context,
                                MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) {
                              return KonkanFourScoreSheet(
                                  playerOne.text,
                                  playerTwo.text,
                                  playerThree.text,
                                  playerFour.text,
                                  numberOfRounds.text);
                            }));
                            konkan4.resetPoints();
                          }
                        },
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        });
  }

  showPlayersNameInsertDialog(context, game) {
    TextEditingController playerOneTeamOne = TextEditingController();
    TextEditingController playerTwoTeamOne = TextEditingController();
    TextEditingController playerOneTeamTwo = TextEditingController();
    TextEditingController playerTwoTeamTwo = TextEditingController();
    TextEditingController numberOfRounds = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              padding: const EdgeInsets.all(10),
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Team A :'),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: playerOneTeamOne,
                        ),
                      ),
                      const Text('  &  '),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: playerTwoTeamOne,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Team B :'),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: playerOneTeamTwo,
                        ),
                      ),
                      const Text('  &  '),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: playerTwoTeamTwo,
                        ),
                      ),
                    ],
                  ),
                  game == 'konkan'
                      ? getNumberOfRound(numberOfRounds)
                      : Container(),
                  Consumer2<DominoProvider, KonkanProvider>(
                      builder: (context, domino, konkan, childe) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          var playerOne =
                              '${playerOneTeamOne.text} & ${playerTwoTeamOne.text}';
                          var playerTwo =
                              '${playerOneTeamTwo.text} & ${playerTwoTeamTwo.text}';
                          if (game == 'konkan') {
                            if (numberOfRounds.text.isEmpty) {
                              var snackBar = SnackBar(
                                content: const Text(
                                  'Number of Rounds Must be more than zero',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.yellow),
                                ),
                                action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else if (int.parse(numberOfRounds.text) <= 0) {
                              var snackBar = SnackBar(
                                content: const Text(
                                  'Number of Rounds Must be more than zero',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.yellow),
                                ),
                                action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              Navigator.pop(context);
                              await Navigator.push(context,
                                  MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) {
                                return KonKanScoreBoard(
                                    playerOne, playerTwo, numberOfRounds.text);
                              }));
                              konkan.resetPoints();
                            }
                          } else {
                            Navigator.pop(context);
                            await Navigator.push(context,
                                MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) {
                              return DominoScoreBoard(playerOne, playerTwo);
                            }));
                            domino.initialGame();
                          }
                        },
                        child: const Text('New Game'));
                  }),
                ],
              ),
            ),
          );
        });
  }

  getNumberOfRound(controller) {
    return Row(
      children: [
        const Text('Number of Rounds'),
        Expanded(
          child: TextField(
            textAlign: TextAlign.center,
            controller: controller,
          ),
        )
      ],
    );
  }
}
