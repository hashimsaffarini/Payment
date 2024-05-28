import 'package:flutter/material.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/ui/widgets/order_info_item.dart';
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
          Image.asset(Assets.imagesBasketImage),
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
          const SizedBox(height: 15),
          CustomButton(
            onTap: () {},
          )
        ],
      ),
    );
  }
}
