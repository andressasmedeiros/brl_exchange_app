import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/exchange_api.dart';
import 'exchange_state.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  final ExchangeApi api;

  ExchangeCubit(this.api) : super(ExchangeInitial());

  Future<void> loadExchange(String toSymbol) async {
    try {
      emit(ExchangeLoading());

      final rate = await api.getCurrentExchangeRate(toSymbol, "BRL");
      final history = await api.getDailyExchangeRates(toSymbol, "BRL");

      for (int i = 0; i < history.length; i++) {
        if (i > 0) {
          history[i].calculateDiff(history[i - 1]);
        }
      }

      emit(ExchangeLoaded(rate: rate.exchangeRate, lastUpdatedAt: rate.lastUpdatedAt, history: history));
    } catch (e) {
      emit(ExchangeError(e.toString()));
    }
  }
  void reset() => emit(ExchangeInitial());
}
