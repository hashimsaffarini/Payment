import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/ui/widgets/card_info_widget.dart';
import 'package:payment/features/checkout/ui/widgets/payment_item_info.dart';
import 'package:payment/features/checkout/ui/widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              style: Styles.style25,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Your payment was successfully',
              style: Styles.style20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 42),
            const PaymentItemInfo(
              title: 'Date',
              value: '12/12/2021',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'Time',
              value: '12:00 PM',
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(
              title: 'To',
              value: 'John Doe',
            ),
            const Divider(
              height: 60,
              color: Color(0xffc7c7c7),
              thickness: 2,
            ),
            const TotalPrice(title: 'Total', value: '\$ 37.97'),
            const SizedBox(height: 20),
            const CardInfoWidget(),
          ],
        ),
      ),
    );
  }
}
