import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/core/utils/app_images.dart';
import 'package:payment/core/utils/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.imagesMasterCard,
              width: 42,
            ),
            const SizedBox(width: 20),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MasterCard',
                  style: Styles.style18,
                ),
                SizedBox(height: 5),
                Text(
                  '**** **** **** 1234',
                  style: Styles.style18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
