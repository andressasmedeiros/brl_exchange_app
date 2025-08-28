import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/exchange_rate.dart';
import '../models/daily_rate.dart';

class ExchangeApi {
  static final String baseUrl = dotenv.env['BASE_URL']!;
  static final String apiKey = dotenv.env['API_KEY']!;

  Future<ExchangeRate> getCurrentExchangeRate(String from, String to) async {
    final url = Uri.parse("$baseUrl/currentExchangeRate?apiKey=$apiKey&from_symbol=$from&to_symbol=$to");

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar cotação atual");
    }

    final data = jsonDecode(response.body);
    return ExchangeRate.fromJson(data);
  }

  Future<List<DailyRate>> getDailyExchangeRates(String from, String to) async {
    final url = Uri.parse("$baseUrl/dailyExchangeRate?apiKey=$apiKey&from_symbol=$from&to_symbol=$to");

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar histórico: ${response.statusCode}");
    }

    final data = jsonDecode(response.body);
    if (!data.containsKey("data")) {
      throw Exception("Histórico não disponível (sem 'data' no JSON)");
    }

    final List<dynamic> list = data["data"];
    return list.map((e) => DailyRate.fromJson(e)).toList();
  }
}
