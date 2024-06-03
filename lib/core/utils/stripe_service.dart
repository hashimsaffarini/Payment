import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';
import 'package:payment/features/checkout/data/models/ephemeral_key/ephemeral_key.dart';
import 'package:payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
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
      {required InitPaymentSheetInputModel initiatePaymentSheet}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiatePaymentSheet.clientSecret,
        customerEphemeralKeySecret: initiatePaymentSheet.ephmeralKeySecret,
        customerId: initiatePaymentSheet.customerId,
        merchantDisplayName: 'Hashim',
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIintentInputModel paymentIintentInputModel}) async {
    var paymentIntent = await createPaymentIntent(paymentIintentInputModel);
    var ephemeralKey = await createEphemeralKey(
        customerId: paymentIintentInputModel.customerID);

    var initiatePaymentSheetModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntent.clientSecret!,
      customerId: paymentIintentInputModel.customerID,
      ephmeralKeySecret: ephemeralKey.secret!,
    );
    await initiatePaymentSheet(
      initiatePaymentSheet: initiatePaymentSheetModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {
        'customer': customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer $ApiKeys.secretKey',
        'Stripe-Version': '2024-04-10',
      },
    );

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}
