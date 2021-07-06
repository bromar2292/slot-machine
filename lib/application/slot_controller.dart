import 'dart:math';

import 'package:get/get.dart';
import 'package:slot_machine/data/win_data.dart';
import 'package:slot_machine/modals/result.dart';
import 'package:slot_machine/modals/win_conditions.dart';

class SlotController extends GetxController {
  Random random = new Random();

  final RxInt _score = 10.obs;

  int get score {
    return _score.value;
  }

  bool showWin = false;

  Result winningResult;

  List<int> slots = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  List<WinCondition> winConditionList = winData.map((data) {
    return WinCondition(results: data);
  }).toList();

  void spin() {
    if (score == 0) {
      return;
    }
    slots = slots.map((x) => x = random.nextInt(5)).toList();
    winningResult = null;

    showWin = false;
    _score(score - 10);

    print(slots);
    WinCondition firstWin = winConditionList.firstWhere((winCon) {
      return winCon.checkWinCondition(slots);
    }, orElse: () => null);

    if (firstWin != null) {
      _score(firstWin.results.points + score);
      winningResult = firstWin.results;
    }

    WinCondition boolWin = winConditionList.firstWhere((sequence) {
      return sequence.didIWin(slots);
    }, orElse: () => null);

    if (boolWin != null) {
      _score(boolWin.results.points + score);
      winningResult = boolWin.results;
    }
    update();
  }

  void incrementCounter() {
    _score(score + 10);

    update();
  }
}
