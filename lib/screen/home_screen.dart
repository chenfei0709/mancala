import 'package:flutter/material.dart';

import '../util/screen_size_util.dart';
import 'game_page/game_page.dart';

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
            width: 550,
            height: 350,
            child: GamePage(),
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
