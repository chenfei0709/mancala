import 'package:flutter/material.dart';

class PitView extends StatelessWidget {
  final Color color;
  final int pitCount;

  const PitView({required this.color, required this.pitCount, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: pitCount == 0 ? Colors.grey : color, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(pitCount.toString()),
          ),
        ),
      ],
    );
  }
}
