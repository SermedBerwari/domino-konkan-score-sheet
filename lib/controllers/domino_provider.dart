import 'package:flutter/cupertino.dart';

class DominoProvider with ChangeNotifier {
  int playerOneCurrentHundreds = 1;
  int playerTwoCurrentHundreds = 1;
  List<String> finishedScoreList = ["X", "X", "X", "X", "O", "O", "O", "O"];
  List<String> playerOneScores = ["", "", "", "", "", "", "", ""];
  List<String> playerTwoScores = ["", "", "", "", "", "", "", ""];
  int plyerOnePoints = 0;
  int plyerTwoPoints = 0;
  int totalPlyerOnePoints = 0;
  int totalPlyerTwoPoints = 0;
  bool isGameFinished = false;
  String winner = "";

  initialGame() {
    playerOneCurrentHundreds = 1;
    playerTwoCurrentHundreds = 1;
    finishedScoreList = ["X", "X", "X", "X", "O", "O", "O", "O"];
    playerOneScores = ["", "", "", "", "", "", "", ""];
    playerTwoScores = ["", "", "", "", "", "", "", ""];
    plyerOnePoints = 0;
    plyerTwoPoints = 0;
    totalPlyerOnePoints = 0;
    totalPlyerTwoPoints = 0;
    isGameFinished = false;
    winner = "";

    notifyListeners();
  }

  void addPonits(int point, player) {
    if (!isGameFinished) {
      if (player == "p1") {
        plyerOnePoints = plyerOnePoints + point;
        totalPlyerOnePoints = totalPlyerOnePoints + point;

        getListOfPlayerOnePoint(plyerOnePoints);
        if (plyerOnePoints >= 100) {
          playerOneCurrentHundreds++;
          playerOneScores = ["", "", "", "", "", "", "", ""];
          plyerOnePoints = plyerOnePoints - 100;
          getListOfPlayerOnePoint(plyerOnePoints);
        }
      } else {
        plyerTwoPoints = plyerTwoPoints + point;
        totalPlyerTwoPoints = totalPlyerTwoPoints + point;
        getListOfPlayerTwoPoint(plyerTwoPoints);
        if (plyerTwoPoints >= 100) {
          playerTwoCurrentHundreds++;
          playerTwoScores = ["", "", "", "", "", "", "", ""];
          plyerTwoPoints = plyerTwoPoints - 100;
          getListOfPlayerTwoPoint(plyerTwoPoints);
        }
      }
    }

    notifyListeners();
  }

  checkResult() {
    if (totalPlyerOnePoints >= 455 &&
        totalPlyerOnePoints > totalPlyerTwoPoints) {
      winner = 'p1';
      isGameFinished = true;
    } else if (totalPlyerTwoPoints >= 455 &&
        totalPlyerTwoPoints > totalPlyerOnePoints) {
      winner = 'p2';
      isGameFinished = true;
    }
  }

  void getListOfPlayerOnePoint(points) {
    switch (points) {
      case 0:
        playerOneScores = ["", "", "", "", "", "", "", ""];
        break;
      case 5:
        playerOneScores = ["", "", "", "", "O", "", "", ""];
        break;
      case 10:
        playerOneScores = ["/", "", "", "", "", "", "", ""];
        break;
      case 15:
        playerOneScores = ["/", "", "", "", "O", "", "", ""];
        break;
      case 20:
        playerOneScores = ["X", "", "", "", "", "", "", ""];
        break;
      case 25:
        playerOneScores = ["X", "", "", "", "O", "", "", ""];
        break;
      case 30:
        playerOneScores = ["X", "/", "", "", "", "", "", ""];
        break;
      case 35:
        playerOneScores = ["X", "/", "", "", "O", "", "", ""];
        break;
      case 40:
        playerOneScores = ["X", "X", "", "", "", "", "", ""];
        break;
      case 45:
        playerOneScores = ["X", "X", "", "", "O", "", "", ""];
        break;
      case 50:
        playerOneScores = ["X", "X", "", "", "O", "O", "", ""];
        break;
      case 55:
        playerOneScores = ["X", "X", "", "", "O", "O", "O", ""];
        break;
      case 60:
        playerOneScores = ["X", "X", "/", "", "O", "O", "", ""];
        break;
      case 65:
        playerOneScores = ["X", "X", "/", "", "O", "O", "O", ""];
        break;
      case 70:
        playerOneScores = ["X", "X", "X", "", "O", "O", "", ""];
        break;
      case 75:
        playerOneScores = ["X", "X", "X", "", "O", "O", "O", ""];
        break;
      case 80:
        playerOneScores = ["X", "X", "X", "/", "O", "O", "", ""];
        break;
      case 85:
        playerOneScores = ["X", "X", "X", "/", "O", "O", "O", ""];
        break;
      case 90:
        playerOneScores = ["X", "X", "X", "/", "O", "O", "O", "O"];
        break;
      case 95:
        playerOneScores = ["X", "X", "X", "X", "O", "O", "O", ""];
        break;
      case 100:
        playerOneScores = ["X", "X", "X", "X", "O", "O", "O", "O"];
        break;
      default:
        playerOneScores = ["", "", "", "", "", "", "", ""];
    }
    notifyListeners();
  }

  getListOfPlayerTwoPoint(points) {
    switch (points) {
      case 0:
        playerTwoScores = ["", "", "", "", "", "", "", ""];
        break;
      case 5:
        playerTwoScores = ["", "", "", "", "O", "", "", ""];
        break;
      case 10:
        playerTwoScores = ["/", "", "", "", "", "", "", ""];
        break;
      case 15:
        playerTwoScores = ["/", "", "", "", "O", "", "", ""];
        break;
      case 20:
        playerTwoScores = ["X", "", "", "", "", "", "", ""];
        break;
      case 25:
        playerTwoScores = ["X", "", "", "", "O", "", "", ""];
        break;
      case 30:
        playerTwoScores = ["X", "/", "", "", "", "", "", ""];
        break;
      case 35:
        playerTwoScores = ["X", "/", "", "", "O", "", "", ""];
        break;
      case 40:
        playerTwoScores = ["X", "X", "", "", "", "", "", ""];
        break;
      case 45:
        playerTwoScores = ["X", "X", "", "", "O", "", "", ""];
        break;
      case 50:
        playerTwoScores = ["X", "X", "", "", "O", "O", "", ""];
        break;
      case 55:
        playerTwoScores = ["X", "X", "", "", "O", "O", "O", ""];
        break;
      case 60:
        playerTwoScores = ["X", "X", "/", "", "O", "O", "", ""];
        break;
      case 65:
        playerTwoScores = ["X", "X", "/", "", "O", "O", "O", ""];
        break;
      case 70:
        playerTwoScores = ["X", "X", "X", "", "O", "O", "", ""];
        break;
      case 75:
        playerTwoScores = ["X", "X", "X", "", "O", "O", "O", ""];
        break;
      case 80:
        playerTwoScores = ["X", "X", "X", "/", "O", "O", "", ""];
        break;
      case 85:
        playerTwoScores = ["X", "X", "X", "/", "O", "O", "O", ""];
        break;
      case 90:
        playerTwoScores = ["X", "X", "X", "/", "O", "O", "O", "O"];
        break;
      case 95:
        playerTwoScores = ["X", "X", "X", "X", "O", "O", "O", ""];
        break;
      case 100:
        playerTwoScores = ["X", "X", "X", "X", "O", "O", "O", "O"];
        break;
      default:
        playerTwoScores = ["", "", "", "", "", "", "", ""];
    }
    notifyListeners();
  }
}
