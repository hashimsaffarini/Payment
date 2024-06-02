import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/data/models/payment_iintent_input_model.dart';
import 'package:payment/features/checkout/logic/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/ui/thank_you_view.dart';

class CustomButtonBlocConcumer extends StatelessWidget {
  const CustomButtonBlocConcumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            BlocProvider.of<PaymentCubit>(context).makePayment(
              paymentIintentInputModel: PaymentIintentInputModel(
                currency: 'USD',
                amount: '1000',
                customerID: 'cus_QDmxtEWAjjxGdy',
              ),
            );
          },
          title: 'Continue Payment',
          isLoading: state is PaymentLoading,
        );
      },
    );
  }
}
