class PaymentIintentInputModel {
  final String amount;
  final String currency;

  PaymentIintentInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
    };
  }
}