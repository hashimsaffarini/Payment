import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/ui/widgets/custom_credit_card.dart';
import 'package:payment/features/checkout/ui/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 18),
        ),
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 18),
        ),
        const SliverToBoxAdapter(
          child: CustomCreditCard(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
              child: CustomButton(
                title: 'Pay ',
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
