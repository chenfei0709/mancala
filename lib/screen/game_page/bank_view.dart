import 'package:flutter/material.dart';

class BankView extends StatelessWidget {
  final Color color;
  final int bankCount;

  const BankView({required this.bankCount, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(bankCount.toString()),
      ),
    );
  }
}
