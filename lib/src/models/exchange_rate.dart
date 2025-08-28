class ExchangeRate {
  final String fromSymbol;
  final String toSymbol;
  final double exchangeRate;
  final String lastUpdatedAt;

  ExchangeRate({required this.fromSymbol, required this.toSymbol, required this.exchangeRate, required this.lastUpdatedAt});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      fromSymbol: json["fromSymbol"],
      toSymbol: json["toSymbol"],
      exchangeRate: (json["exchangeRate"] as num).toDouble(),
      lastUpdatedAt: json["lastUpdatedAt"] ?? "",
    );
  }
}
