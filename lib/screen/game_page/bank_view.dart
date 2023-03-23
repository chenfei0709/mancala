import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const BankView({required this.width, required this.height, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
