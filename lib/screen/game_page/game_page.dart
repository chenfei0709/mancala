import 'package:flutter/material.dart';
import 'package:mancala/enum/space_type.dart';
import 'package:mancala/model/current_space_info.dart';
import 'package:mancala/model/player_model.dart';
import 'package:mancala/screen/game_page/bank_view.dart';
import 'package:mancala/screen/game_page/pit_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  PlayerModel playerBlue = PlayerModel(color: Colors.blue);
  PlayerModel playerRed = PlayerModel(color: Colors.red);
  late PlayerModel currentPlayer;

  @override
  void initState() {
    currentPlayer = playerBlue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: BankView(bankCount: playerRed.bankCount, color: playerRed.color),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // userRed pits
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                    6,
                    (pitPosition) => InkWell(
                      onTap: () {
                        if (currentPlayer == playerRed && currentPlayer.pitCountList[pitPosition] != 0) {
                          _onTipToped(player: playerRed, pitPosition: pitPosition);
                        }
                      },
                      child: PitView(
                        color: playerRed.color.withOpacity(currentPlayer == playerRed ? 1.0 : 0.5),
                        pitCount: playerRed.pitCountList[pitPosition],
                      ),
                    ),
                  ).toList().reversed.toList(),
                ),
                // userBlue pits
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                    6,
                    (pitPosition) => InkWell(
                      onTap: () {
                        if (currentPlayer == playerBlue && currentPlayer.pitCountList[pitPosition] != 0) {
                          _onTipToped(player: playerBlue, pitPosition: pitPosition);
                        }
                      },
                      child: PitView(
                        color: playerBlue.color.withOpacity(currentPlayer == playerBlue ? 1.0 : 0.5),
                        pitCount: playerBlue.pitCountList[pitPosition],
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: BankView(bankCount: playerBlue.bankCount, color: playerBlue.color),
          ),
        ],
      ),
    );
  }

  void _onTipToped({required PlayerModel player, required int pitPosition}) {
    PlayerModel ourSidePlayer = player;
    PlayerModel otherSidePlayer = player == playerBlue ? playerRed : playerBlue;

    CurrentSpaceInfo currentSpaceInfo = CurrentSpaceInfo();

    int countToPit = ourSidePlayer.pitCountList[pitPosition];
    ourSidePlayer.pitCountList[pitPosition] = 0;

    // <<< 播种逻辑
    // 在我方播种 最多可播6-(position+1)次
    if (countToPit > 0) {
      for (var i = 0; i < 5 - pitPosition; i++) {
        countToPit--;
        ourSidePlayer.pitCountList[pitPosition + i + 1]++;

        currentSpaceInfo.currentPlayer = ourSidePlayer;
        currentSpaceInfo.spaceType = SpaceType.pit;
        currentSpaceInfo.spaceIndex = pitPosition + i + 1;

        if (countToPit == 0) break;
      }
    }

    while_loop:
    while (countToPit > 0) {
      // 在我方仓库放置
      countToPit--;
      ourSidePlayer.bankCount++;

      currentSpaceInfo.currentPlayer = ourSidePlayer;
      currentSpaceInfo.spaceType = SpaceType.bank;
      currentSpaceInfo.spaceIndex = null;

      if (countToPit == 0) break while_loop;

      // 在对方播种，最多可播6次
      for (var i = 0; i < 6; i++) {
        countToPit--;
        otherSidePlayer.pitCountList[i]++;

        currentSpaceInfo.currentPlayer = otherSidePlayer;
        currentSpaceInfo.spaceType = SpaceType.pit;
        currentSpaceInfo.spaceIndex = i;

        if (countToPit == 0) break while_loop;
      }

      // 在对方仓库不放置

      // 在我方播种，最多可播6次
      for (var i = 0; i < 6; i++) {
        countToPit--;
        ourSidePlayer.pitCountList[i]++;

        currentSpaceInfo.currentPlayer = ourSidePlayer;
        currentSpaceInfo.spaceType = SpaceType.pit;
        currentSpaceInfo.spaceIndex = i;

        if (countToPit == 0) break while_loop;
      }
    }
    // 播种逻辑 >>>

    // 播种结束

    // 判断是否再执行一次
    if (!(currentSpaceInfo.currentPlayer == ourSidePlayer && currentSpaceInfo.spaceType == SpaceType.bank)) {
      // 最终不在我方仓库放置, 交换行动方
      currentPlayer = otherSidePlayer;
    } else {
      // 最终在我方仓库放置, 再执行一次
    }

    // 判断是否抢子
    if (currentSpaceInfo.currentPlayer == ourSidePlayer &&
        currentSpaceInfo.spaceType == SpaceType.pit &&
        ourSidePlayer.pitCountList[currentSpaceInfo.spaceIndex!] == 1) {
      // 最后一子落在我方空白处，可以抢子
      ourSidePlayer.bankCount += ourSidePlayer.pitCountList[currentSpaceInfo.spaceIndex!];
      ourSidePlayer.bankCount += otherSidePlayer.pitCountList[5 - currentSpaceInfo.spaceIndex!];
      ourSidePlayer.pitCountList[currentSpaceInfo.spaceIndex!] = 0;
      otherSidePlayer.pitCountList[5 - currentSpaceInfo.spaceIndex!] = 0;
    }

    setState(() {});
  }
}
