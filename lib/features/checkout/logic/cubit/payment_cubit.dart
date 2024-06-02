import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/payment_iintent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIintentInputModel paymentIintentInputModel}) async {
    emit(PaymentLoading());
    var response = await checkoutRepo.makePayment(
        paymentIintentInputModel: paymentIintentInputModel);
    response.fold(
      (l) => emit(PaymentFailure(errorMessage: l.toString())),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
