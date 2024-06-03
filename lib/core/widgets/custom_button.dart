import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    this.isLoading = false,
  });
  final void Function()? onTap;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: BoxDecoration(
          color: const Color(0xff34A853),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive()
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
