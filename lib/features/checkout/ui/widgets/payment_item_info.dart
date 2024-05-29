import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.styleBold18,
        ),
      ],
    );
  }
}
