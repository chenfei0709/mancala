import 'package:flutter/material.dart';
import 'package:mancala/screen/game_page/game_page.dart';
import 'package:mancala/util/screen_size_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MANCALA"),
      ),
      body: Row(
        children: [
          SizedBox(
            width: ScreenSizeUtil.getWidth(context) * 0.7,
            height: double.infinity,
            child: const GamePage(),
          ),
          Container(
            width: ScreenSizeUtil.getWidth(context) * 0.3,
            height: double.infinity,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
