import '../models/daily_rate.dart';

abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final double rate;
  final String lastUpdatedAt;
  final List<DailyRate> history;

  ExchangeLoaded({required this.rate, required this.lastUpdatedAt, required this.history});
}

class ExchangeError extends ExchangeState {
  final String message;

  ExchangeError(this.message);
}
