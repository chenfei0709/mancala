import 'package:flutter/material.dart';

class PitView extends StatelessWidget {
  final double squareSize;
  final Color color;

  const PitView({required this.squareSize, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: squareSize,
      height: squareSize,
      color: color,
    );
  }
}

class PitListView extends StatelessWidget {
  final int count;
  final double squareSize;
  final Color color;

  const PitListView({required this.count, required this.squareSize, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate(
        count,
        (index) => PitView(squareSize: squareSize, color: color),
      ),
    );
  }
}
