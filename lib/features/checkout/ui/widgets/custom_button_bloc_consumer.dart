import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/details.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/features/checkout/data/models/item_list_model/item_list_model.dart';
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
            if (PaymentCubit.selectedPaymentMethod == 0) {
              BlocProvider.of<PaymentCubit>(context).makePayment(
                paymentIintentInputModel: PaymentIintentInputModel(
                  currency: 'USD',
                  amount: '1000',
                  customerID: 'cus_QDmxtEWAjjxGdy',
                ),
              );
            } else {
              var data = getTransactionData();
              excutePayPalPayment(context, data);
            }
          },
          title: 'Continue Payment',
          isLoading: state is PaymentLoading,
        );
      },
    );
  }

  void excutePayPalPayment(
      BuildContext context, ({AmountModel amount, ItemListModel items}) data) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId:
              "AQ3WV4BxRHBTwFb3mz7fs_J6CvIaHL2ellVp0ofnHmUIap4y1g_UdKeMczGW_hRKWbgXvOPTBBtaPXXn",
          secretKey:
              "EIPiJE-x3XwqHk0p8YIiDI7ONrH9onc6oDc1XEtudK5J4xkiAnJkcBMhCESSTWyK2rLaD2lZ-LO0yrCr",
          transactions: [
            {
              "amount": data.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": {
                "items": data.items.toJson(),
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel items}) getTransactionData() {
    var amount = AmountModel(
      currency: 'USD',
      total: '100',
      details: Details(
        subtotal: '100',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> itemsList = [
      OrderItemModel(
        name: 'Apple',
        quantity: 10,
        price: '4',
        currency: 'USD',
      ),
      OrderItemModel(
        name: 'Banana',
        quantity: 5,
        price: '12',
        currency: 'USD',
      ),
    ];
    var items = ItemListModel(orders: itemsList);
    return (amount: amount, items: items);
  }
}
