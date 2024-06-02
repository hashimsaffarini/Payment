class PaymentIintentInputModel {
  final String amount;
  final String currency;
  final String customerID;

  PaymentIintentInputModel(
      {required this.customerID, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerID,
    };
  }
}
