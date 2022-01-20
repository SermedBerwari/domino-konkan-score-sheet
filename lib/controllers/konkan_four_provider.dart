// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class KonkanFourProvider with ChangeNotifier {
  int playeOneTotalPoints = 0;
  int playeTwoTotalPoints = 0;
  int playeThreeTotalPoints = 0;
  int playeFourTotalPoints = 0;
  var roundsPoints = [];

  void addPoints(p1, p2, p3, p4, round, rounds) {
    String addP1 = "0";
    String addP2 = "0";
    String addP3 = "0";
    String addP4 = "0";
    playeOneTotalPoints = 0;
    playeTwoTotalPoints = 0;
    playeThreeTotalPoints = 0;
    playeFourTotalPoints = 0;

    if (p1 == "xx") {
      if (round == rounds - 1) {
        addP2 = ((int.parse(p2) + 100) * 2).toString();
        addP3 = ((int.parse(p3) + 100) * 2).toString();
        addP4 = ((int.parse(p4) + 100) * 2).toString();
        addP1 = p1;
      } else {
        addP1 = 'x';
        addP2 = p2;
        addP3 = p3;
        addP4 = p4;
      }
    } else if (p2 == 'xx') {
      if (round == rounds - 1) {
        addP1 = ((int.parse(p1) + 100) * 2).toString();
        addP3 = ((int.parse(p3) + 100) * 2).toString();
        addP4 = ((int.parse(p4) + 100) * 2).toString();
        addP2 = p2;
      } else {
        addP1 = p1;
        addP3 = p3;
        addP4 = p4;
        addP2 = 'x';
      }
    } else if (p3 == 'xx') {
      if (round == rounds - 1) {
        addP1 = ((int.parse(p1) + 100) * 2).toString();
        addP2 = ((int.parse(p2) + 100) * 2).toString();
        addP4 = ((int.parse(p4) + 100) * 2).toString();
        addP3 = p3;
      } else {
        addP1 = p1;
        addP2 = p2;
        addP4 = p4;
        addP3 = 'x';
      }
    } else if (p4 == 'xx') {
      if (round == rounds - 1) {
        addP1 = ((int.parse(p1) + 100) * 2).toString();
        addP3 = ((int.parse(p3) + 100) * 2).toString();
        addP2 = ((int.parse(p2) + 100) * 2).toString();
        addP4 = p4;
      } else {
        addP1 = p1;
        addP3 = p3;
        addP2 = p2;
        addP4 = 'x';
      }
    } else {
      addP1 = p1;
      addP2 = p2;
      addP3 = p3;
      addP4 = p4;
    }

    roundsPoints.add({"p1": addP1, "p2": addP2, "p3": addP3, "p4": addP4});
    roundsPoints.map((e) {
      int p1Points = 0;
      int p2Points = 0;
      int p3Points = 0;
      int p4Points = 0;
      if (e['p1'] == 'x' || e['p1'] == 'xx') {
        p1Points = -25;
        p2Points = int.parse(e['p2']);
        p3Points = int.parse(e['p3']);
        p4Points = int.parse(e['p4']);
      } else if (e['p2'] == 'x' || e['p2'] == 'xx') {
        p2Points = -25;
        p1Points = int.parse(e['p1']);
        p3Points = int.parse(e['p3']);
        p4Points = int.parse(e['p4']);
      } else if (e['p3'] == 'x' || e['p3'] == 'xx') {
        p3Points = -25;
        p1Points = int.parse(e['p1']);
        p2Points = int.parse(e['p2']);
        p4Points = int.parse(e['p4']);
      } else if (e['p4'] == 'x' || e['p4'] == 'xx') {
        p4Points = -25;
        p1Points = int.parse(e['p1']);
        p3Points = int.parse(e['p3']);
        p2Points = int.parse(e['p2']);
      }

      playeOneTotalPoints = playeOneTotalPoints + p1Points;
      playeTwoTotalPoints = playeTwoTotalPoints + p2Points;
      playeThreeTotalPoints = playeThreeTotalPoints + p3Points;
      playeFourTotalPoints = playeFourTotalPoints + p4Points;
    }).toList();
    notifyListeners();
  }

  void resetPoints() {
    roundsPoints.clear();
    playeOneTotalPoints = 0;
    playeTwoTotalPoints = 0;
    playeThreeTotalPoints = 0;
    playeFourTotalPoints = 0;
    notifyListeners();
  }
}
