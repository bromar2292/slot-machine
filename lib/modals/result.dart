class Result {
  List<int> winningCombo;
  List<bool> winningSequence;
  int points;

  Result({this.winningCombo, this.points, this.winningSequence});

  String get winningDesc {
    if (points == 0) {
      return 'try again';
    }
    return '$winningCombo you have won $points points  ';
  }
}
