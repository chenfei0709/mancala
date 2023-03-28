import 'package:mancala/enum/space_type.dart';
import 'package:mancala/model/player_model.dart';

class CurrentSpaceInfo {
  PlayerModel? currentPlayer;
  SpaceType? spaceType;
  int? spaceIndex;

  CurrentSpaceInfo({this.currentPlayer, this.spaceType, this.spaceIndex});
}
