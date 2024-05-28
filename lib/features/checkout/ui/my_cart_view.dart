import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/ui/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            Assets.imagesArrow,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: Styles.style25,
          textAlign: TextAlign.center,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
