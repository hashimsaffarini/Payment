import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.center,
          title,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          textAlign: TextAlign.center,
          value,
          style: Styles.style24,
        ),
      ],
    );
  }
}
