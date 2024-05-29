import 'package:flutter/material.dart';
import 'package:payment/features/checkout/ui/widgets/custom_credit_card.dart';
import 'package:payment/features/checkout/ui/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 18),
          PaymentMethods(),
          SizedBox(height: 18),
          CustomCreditCard(),
        ],
      ),
    );
  }
}
