import 'package:flutter/material.dart';
import 'package:payment/features/checkout/ui/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xffD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
            left: 20 + 8,
            right: 20 + 8,
            child: Row(
              children: List.generate(
                20,
                (index) => const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: CustomLine(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: const Color(0xffB8B8B8),
    );
  }
}
