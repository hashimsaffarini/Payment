import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/checkout/data/models/payment_iintent_input_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIintentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initiatePaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: 'Hashim'));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIintentInputModel paymentIintentInputModel}) async {
    var paymentIntent = await createPaymentIntent(paymentIintentInputModel);
    await initiatePaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret!);
    await displayPaymentSheet();
  }


  // Future<PaymentIntentModel> createCustomer(
  //     PaymentIintentInputModel paymentIntentInputModel) async {
  //   var response = await apiService.post(
  //     body: paymentIntentInputModel.toJson(),
  //     contentType: Headers.formUrlEncodedContentType,
  //     url: 'https://api.stripe.com/v1/payment_intents',
  //     token: ApiKeys.secretKey,
  //   );

  //   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

  //   return paymentIntentModel;
  // }
}
