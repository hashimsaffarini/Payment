import 'package:flutter/material.dart';
import 'package:payment/features/checkout/ui/widgets/payment_method_item.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PaymentMethodItem(
          isActive: true,
        ),
      ],
    );
  }
}
