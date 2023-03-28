import 'dart:ui';

class PlayerModel {
  Color color;
  List<int> pitCountList = [4, 4, 4, 4, 4, 4];
  int bankCount = 0;

  PlayerModel({required this.color});

  bool isPitEmpty(int index) {
    return pitCountList[index] == 0;
  }

  int totalCount() {
    return pitCountList.fold(bankCount, (previousValue, element) => previousValue + element);
  }
}
