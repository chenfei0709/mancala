import 'package:flutter/material.dart';
import 'package:mancala/screen/game_page/bank_view.dart';
import 'package:mancala/screen/game_page/pit_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: (constraints.maxHeight - constraints.maxWidth * 0.2) / 6),
                BankView(
                  width: constraints.maxWidth * 0.12,
                  height: constraints.maxHeight * 0.5,
                  color: Colors.red,
                ),
              ],
            ),
            SizedBox(
              width: constraints.maxWidth * 0.7,
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  PitListView(
                    count: 6,
                    squareSize: constraints.maxWidth * 0.1,
                    color: Colors.red,
                  ),
                  const Spacer(flex: 4),
                  PitListView(
                    count: 6,
                    squareSize: constraints.maxWidth * 0.1,
                    color: Colors.blue,
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BankView(
                  width: constraints.maxWidth * 0.12,
                  height: constraints.maxHeight * 0.5,
                  color: Colors.blue,
                ),
                SizedBox(height: (constraints.maxHeight - constraints.maxWidth * 0.2) / 6),
              ],
            ),
          ],
        );
      },
    );
  }
}
