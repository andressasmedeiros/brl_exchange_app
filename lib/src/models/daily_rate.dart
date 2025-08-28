class DailyRate {
  final double open;
  final double high;
  final double low;
  final double close;
  final String? date;
  double? closeDiff;

  DailyRate({required this.open, required this.high, required this.low, required this.close, required this.date, this.closeDiff});

  factory DailyRate.fromJson(Map<String, dynamic> json) {
    return DailyRate(
      open: (json["open"] as num).toDouble(),
      high: (json["high"] as num).toDouble(),
      low: (json["low"] as num).toDouble(),
      close: (json["close"] as num).toDouble(),
      date: json["date"] as String?,
    );
  }

  void calculateDiff(DailyRate? previousDay) {
    if (previousDay != null) {
      closeDiff = close - previousDay.close;
    }
  }
}
