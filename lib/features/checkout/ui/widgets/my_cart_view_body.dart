import 'package:flutter/material.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/ui/payment_details_view.dart';
import 'package:payment/features/checkout/ui/widgets/order_info_item.dart';
import 'package:payment/features/checkout/ui/widgets/payment_methods_list_view.dart';
import 'package:payment/features/checkout/ui/widgets/total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset(Assets.imagesBasketImage)),
          const SizedBox(height: 25),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$ 42.97',
          ),
          const SizedBox(height: 15),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$ 10',
          ),
          const SizedBox(height: 15),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$ 5',
          ),
          const SizedBox(height: 15),
          const Divider(
            color: Color(0xffc7c7c7),
            thickness: 2,
          ),
          const SizedBox(height: 15),
          const TotalPrice(
            title: 'Total',
            value: '\$ 37.97',
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return const PaymentMethodsButtomSheets();
                  });
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class PaymentMethodsButtomSheets extends StatelessWidget {
  const PaymentMethodsButtomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(height: 32),
          CustomButton(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PaymentDetailsView();
                }));
              },
              title: 'Continue Payment')
        ],
      ),
    );
  }
}
