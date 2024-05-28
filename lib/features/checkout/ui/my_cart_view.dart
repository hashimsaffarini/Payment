import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/utils/styles.dart';

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
      body: const Center(
        child: Text('My Cart Page'),
      ),
    );
  }
}
