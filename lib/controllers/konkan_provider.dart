import 'package:flutter/material.dart';

class KonkanProvider with ChangeNotifier {
  int playeOneTotalPoints = 0;
  int playeTwoTotalPoints = 0;
  var roundsPoints = [];
  void addPoints(p1, p2, round, rounds) {
    String addP1 = "0";
    String addP2 = "0";
    playeOneTotalPoints = 0;
    playeTwoTotalPoints = 0;

    if (p1 == "xx") {
      if (round == rounds - 1) {
        addP2 = ((int.parse(p2) + 100) * 2).toString();
        addP1 = p1;
      } else {
        addP1 = 'x';
        addP2 = p2;
      }
    } else if (p2 == 'xx') {
      if (round == rounds - 1) {
        addP1 = ((int.parse(p1) + 100) * 2).toString();
        addP2 = p2;
      } else {
        addP1 = p1;
        addP2 = 'x';
      }
    } else {
      addP1 = p1;
      addP2 = p2;
    }

    roundsPoints.add({"p1": addP1, "p2": addP2});
    roundsPoints.map((e) {
      int p1Points = 0;
      int p2Points = 0;
      if (e['p1'] == 'x' || e['p1'] == 'xx') {
        p1Points = -25;
        p2Points = int.parse(e['p2']);
      } else if (e['p2'] == 'x' || e['p2'] == 'xx') {
        p2Points = -25;
        p1Points = int.parse(e['p1']);
      }

      playeOneTotalPoints = playeOneTotalPoints + p1Points;
      playeTwoTotalPoints = playeTwoTotalPoints + p2Points;
    }).toList();
    notifyListeners();
  }

  void resetPoints() {
    roundsPoints.clear();
    playeOneTotalPoints = 0;
    playeTwoTotalPoints = 0;
    notifyListeners();
  }
}
