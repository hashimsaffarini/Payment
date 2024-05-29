import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isActive ? const Color(0xff34A853) : const Color(0xff000080),
            width: 1.50,
          ),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xff34A853) : Colors.grey,
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
          ),
        ),
      ),
    );
  }
}
