import 'package:slot_machine/modals/result.dart';

class WinCondition {
  Result results;

  WinCondition({this.results});

  bool checkWinCondition(List<int> slots) {
    if (results.winningCombo != null) {
      for (int i = 0; i < slots.length; i++) {
        if (results.winningCombo.length > i) {
          if (slots[i] != results.winningCombo[i]) {
            return false;
          }
        }
      }
      return true;
    } else {
      return false;
    }
  }

  bool didIWin(List<int> slots) {
    if (results.winningSequence == null) {
      return false;
    }
    try {
      for (int slotIndex = 0; slotIndex < slots.length; slotIndex++) {
        bool isWinner = true;
        int slotNumber = slots[slotIndex];

        for (int seqIndex = 0;
            seqIndex < results.winningSequence.length;
            seqIndex++) {
          final bool boolValue = results.winningSequence[seqIndex];

          if (boolValue) {
            if (slots[seqIndex] != slotNumber) {
              isWinner = false;
            }
          } else {
            if (slots[seqIndex] == slotNumber) {}
          }
        }

        print('is winner: $isWinner');
        print('');

        if (isWinner) {
          return true;
        }
      }
    } catch (error) {
      print(error);
    }

    return false;
  }
}
